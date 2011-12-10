//	$Id$
//	$Source$

package net.loadbang.shadox;

/**	A BlinkTask is a repeating FlashTask (which can be cancelled).

	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
 */

abstract public class BlinkTask extends FlashTask {
	private int itsOffTicks;
	private boolean itsRunning;

	public BlinkTask(DisplayTaskManager manager, int onTicks, int offTicks) {
		super(manager, onTicks);
		itsOffTicks = offTicks;
		itsRunning = true;
	}
	
	/**	Cancel the blink task. The current or next blick/flash will complete;
	 	this call merely cancels the reschedule. */

	@Override void cancel() {
		itsRunning = false;
	}
	
	/**	Start the task.
	
		@param cue the time at which the event was cued - this should be
			{@link DisplayTaskManager#newTime}(0) but it's possible that the
			event was missed at the correct time if the scheduler has
			run on before this event was scheduled.
	 */
	
	abstract void blinkOn(DisplayTaskManager.ScheduleTime cue);
	
	/**	Finish the task. */
	abstract void blinkOff(DisplayTaskManager.ScheduleTime cue);
	
	@Override
	final void flashOn(DisplayTaskManager.ScheduleTime cue) {
		blinkOn(cue);
	}
	
	@Override
	final void flashOff(DisplayTaskManager.ScheduleTime cue) {
		blinkOff(cue);
		
		if (itsRunning) {
			schedule(cue.advance(itsOffTicks));
		}
	}
}
