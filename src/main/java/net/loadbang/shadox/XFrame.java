//	$Id$
//	$Source$

package net.loadbang.shadox;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import net.loadbang.shado.Frame;
import net.loadbang.shado.IRenderable;
import net.loadbang.shado.exn.OperationException;
import net.loadbang.shadox.DisplayTaskManager.ScheduleTime;

/**	An augmented frame with some extra facilities, such
	as blinking and flashing of elements.

	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
 */

public class XFrame extends Frame {
	private DisplayTaskManager itsTaskManager;
	
	/**	A map from renderables to blink tasks (if any) which are
		blinking them. Only needed so we can issue cancel() calls!
	 */
	
	private Map<IRenderable, Task> itsBlinks;
	
	/**	Map from renderables to scroll tasks for them: needed to
	 	cancel.
	 */

	private Map<IRenderable, Task> itsScrolls;
	
	/**	Map from renderables to flash tasks for them: needed to
 		cancel.
	 */

	private Map<IRenderable, Task> itsFlashes;
	
	public XFrame(DisplayTaskManager manager) {
		itsTaskManager = manager;
		
		itsBlinks = Collections.synchronizedMap(new HashMap<IRenderable, Task>());
		itsScrolls = Collections.synchronizedMap(new HashMap<IRenderable, Task>());
		itsFlashes = Collections.synchronizedMap(new HashMap<IRenderable, Task>());
	}
	
	/**	Flash a particular component once.

		@param r the renderable to flash
 		@param durationTicks the duration of the flash, in task manager ticks
 		@return this frame itself (for chaining)
	 */

	public XFrame flash(final IRenderable r, int durationTicks, ScheduleTime when00) {
		FlashTask task = new FlashTask(itsTaskManager, durationTicks) {
			@Override
			void flashOn(ScheduleTime cue) {
				try { show(r); } catch (OperationException e) { e.printStackTrace(); }
			};
			
			@Override
			void flashOff(ScheduleTime cue) {
				try { hide(r); } catch (OperationException e) { e.printStackTrace(); }
				replace(itsFlashes, r, null, null, false);

			};
		};
		
		if (when00 == null) {
			when00 = itsTaskManager.newTime(0);
		}

		replace(itsFlashes, r, task, when00, true);

		return this;
	}

	/**	Start a particular component blinking. We have to be *very* careful
	 	of deadlocks here - the scheduled task attempts to lock the frame to
	 	do the blinking, so we mustn't have the lock while we're setting
	 	things up in the scheduler.

		@param r the renderable to blink
	 	@param onTicks the duration of the blink-on, in task manager ticks
	 	@param offTicks the duration of the blink-off, in task manager ticks
	 	@return this frame itself (for chaining)
	 */

	public XFrame blink(final IRenderable r, int onTicks, int offTicks, ScheduleTime when00) {
		BlinkTask task = new BlinkTask(itsTaskManager, onTicks, offTicks) {
			@Override void blinkOn(DisplayTaskManager.ScheduleTime cue) {
				try { show(r); } catch (OperationException e) { e.printStackTrace(); cancel(); }
			}
			
			@Override void blinkOff(DisplayTaskManager.ScheduleTime cue) {
				try { hide(r); } catch (OperationException e) { e.printStackTrace(); cancel(); }
			}
		};

		replace(itsBlinks, r, task, when00, true);

		return this;
	}
	
	/**	Generic replace of a task associated with a renderable (such as
	 	blink or scroll); cancel the old one (if any), put the new one
	 	(if any).
	 */

	private void replace(Map<IRenderable, Task> taskMap,
						 IRenderable renderable,
						 Task task00,
						 ScheduleTime when00,
						 boolean cancel
						) {
		synchronized (taskMap) {
			Task t00 = taskMap.get(renderable);
			
			if (t00 != null) {
				if (cancel) { t00.cancel(); }
				taskMap.remove(renderable);
			}
			
			if (task00 != null) {
				taskMap.put(renderable, task00);
				
				if (when00 == null) {
					when00 = itsTaskManager.newTime(0);
				}

				task00.schedule(when00);
			}
		}
	}
	
	/**	Cancel blinking on this renderable. The current blink will finish;
		in fact, if we're between blinks, the next blink will occur. (So,
		we don't currently have a failsafe way of going from "blink" to
		"on" - our philosophy is to do that via layer manipulation in
		the frame.)
		
	 	@param r the renderable on which to cancel blinking
	 	@return this frame itself (for chaining)
	 */

	public XFrame noBlink(IRenderable r) {
		replace(itsBlinks, r, null, null, true);
		return this;
	}
	
	private void scroll1(final IRenderable r, int distance,
						 final int dirX, final int dirY, int intervalTicks,
						 ScheduleTime when00,
						 final ICompletion completion
						)
		throws OperationException
	{
		ICompletion fullCompletion =
			new ICompletion() {
				public void completed(boolean success) {
					replace(itsScrolls, r, null, null, false);
					completion.completed(success);
				}
		};

		SequenceTask task = new SequenceTask(itsTaskManager, distance, intervalTicks, fullCompletion) {
			@Override void fire(ScheduleTime cue, int _) {
				try {
					moveBy(r, dirX, dirY);
				} catch (OperationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		};
		
		replace(itsScrolls, r, task, when00, true);
	}
	
	public XFrame scrollX(IRenderable r,
						  int finalX,
						  int intervalTicks,
						  ScheduleTime when00,
						  ICompletion completion
						 ) throws OperationException {
		noScroll(r);			//	Immediately, before X calculation.
		final PositionedPressRouter pos = find(r);
		int startX = pos.getX();
		int distance = Math.abs(finalX - startX);
		final int dir = (finalX > startX ? +1 : -1);
		
		scroll1(r, distance, dir, 0, intervalTicks, when00, completion);
		return this;
	}
	
	public XFrame scrollY(IRenderable r,
						  int finalY,
						  int intervalTicks,
						  ScheduleTime when00,
						  ICompletion completion
						 ) throws OperationException {
		noScroll(r);			//	Immediately, before Y calculation.
		final PositionedPressRouter pos = find(r);
		int startY = pos.getY();
		int distance = Math.abs(finalY - startY);
		final int dir = (finalY > startY ? +1 : -1);
		
		scroll1(r, distance, 0, dir, intervalTicks, when00, completion);
		return this;
	}
	
	public XFrame noScroll(IRenderable r) {
		replace(itsScrolls, r, null, null, true);
		return this;
	}
	

	
	/**	Schedule a rendering pass, which will happen on the next tick
	 	regardless of whether other tasks (flash, blink, scroll) fire.

	 */

	public void refresh() {
		itsTaskManager.schedule(new RefreshOnlyTask(), 0);
	}
}
