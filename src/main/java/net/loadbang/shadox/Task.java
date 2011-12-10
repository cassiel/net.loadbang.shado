//	$Id$
//	$Source$

package net.loadbang.shadox;

import net.loadbang.shadox.DisplayTaskManager.ScheduleTime;

/**	Top-level client tasks which can schedule themselves
 	(probably in terms of {@link IBasicTask}.

	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
 */

abstract public class Task {
	private DisplayTaskManager itsTaskManager;

	public Task(DisplayTaskManager manager) {
		itsTaskManager = manager;
	}
	
	/**	Schedule this task to do its thing (perhaps
	 	repeatedly).
	 	
	 	@param when the time at which to start
	 */

	abstract void schedule(ScheduleTime when);
	
	/**	Cancel this task, in some way (which may mean telling
		it to cancel after its next iteration).
	 */
	
	abstract void cancel();

	/**	Schedule a flash for so many ticks in the future. */

	public void schedule(int ticksInFuture) {
		schedule(itsTaskManager.newTime(ticksInFuture));
	}
	
	protected void coreSchedule(IBasicTask task, ScheduleTime when) {
		itsTaskManager.schedule(task, when);
	}
}
