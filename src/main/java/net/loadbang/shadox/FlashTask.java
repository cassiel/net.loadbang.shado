//	$Id$
//	$Source$

package net.loadbang.shadox;

import net.loadbang.shadox.DisplayTaskManager.ScheduleTime;

/**	A task which implements flash-on and flash-off.

 	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
 */

public abstract class FlashTask extends Task {
	private int itsDurationTicks;
	private boolean itsActive;

	public FlashTask(DisplayTaskManager manager, int durationTicks) {
		super(manager);
		itsDurationTicks = durationTicks;
		itsActive = true;
	}
	
	protected int getDurationTicks() {
		return itsDurationTicks;
	}
	
	/**	Schedule this Flash as a pair of tasks: one for on(),
		one for off().
		
	 	@param when the scheduler time to start the flash
	 */

	@Override public void schedule(ScheduleTime when) {
		IBasicTask t1 = new IBasicTask() {
			public boolean bangThenRefresh(ScheduleTime cue) {
				if (itsActive) {
					flashOn(cue);
					return true;
				} else {
					return false;
				}
			}
		};

		IBasicTask t2 = new IBasicTask() {
			public boolean bangThenRefresh(ScheduleTime cue) {
				if (itsActive) {
					flashOff(cue);
					return true;
				} else {
					return false;
				}
			}
		};
		
		coreSchedule(t1, when);
		coreSchedule(t2, when.advance(itsDurationTicks));
	}
	
	/**	Start the task.
		
		@param cue the time at which the event was cued - this should be
			{@link DisplayTaskManager#newTime}(0) but it's possible that the
			event was missed at the correct time if the scheduler has
			run on before this event was scheduled.
	 */

	abstract void flashOn(DisplayTaskManager.ScheduleTime cue);

	/**	Finish the task. */
	abstract void flashOff(DisplayTaskManager.ScheduleTime cue);
	
	/**	Cancel: if we're half way through a flash, it'll stick. */
	@Override void cancel() {
		itsActive = false;
	}
}
