//	$Id$
//	$Source$

package net.loadbang.shadox;

/**	Simple one-shot task interface which the task scheduler knows about.

	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
*/

public interface IBasicTask {
	/**	Start the task.
	
		@param cue the time at which the event was cued - this should be
			{@link DisplayTaskManager#newTime}(0) but it's possible that the
			event was missed at the correct time if the scheduler has
			run on before this event was scheduled.

	 	@return true if we've done something which requires a re-render.
	 */

	boolean bangThenRefresh(DisplayTaskManager.ScheduleTime cue);
}
