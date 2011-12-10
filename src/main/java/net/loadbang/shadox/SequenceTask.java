//	$Id$
//	$Source$

package net.loadbang.shadox;

import net.loadbang.shadox.DisplayTaskManager.ScheduleTime;

/**	A task which can (for example) scroll an element within a
	frame.

	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
 */

abstract public class SequenceTask extends Task {
	private int itsLimit;
	private int itsIntervalTicks;
	private int itsCount;
	private boolean itsRunning;

	/**	Local copy of the task we're presenting to the scheduler, purely
		so that we can synchronise against it for cancelling.
	 */

	private IBasicTask itsTask00;
	private ICompletion itsCompletion;

	/**	Task intended for sequencing.
	 * 
	 	@param manager
	 	@param limit
	 	@param intervalTicks
	 	@param completion
	 */
	public SequenceTask(DisplayTaskManager manager, int limit, int intervalTicks, ICompletion completion) {
		super(manager);
		itsLimit = limit;
		itsIntervalTicks = intervalTicks;
		itsCompletion = completion;
		itsCount = 0;
		itsRunning = true;
	}

	abstract void fire(ScheduleTime cue, int i);

	@Override public void schedule(ScheduleTime when) {
		IBasicTask task =
			new IBasicTask() {
				/**	Fire this event from the scheduler. Synchronized because
					it updates a count, and we want atomic lockout with the
					cancelling routine.
				 */

				public synchronized boolean bangThenRefresh(ScheduleTime cue) {
					if (itsRunning) {
						boolean fired = (itsCount < itsLimit);

						if (fired) {
							fire(cue, itsCount++);
						}
					
						if (itsCount < itsLimit) {
							schedule(cue.advance(itsIntervalTicks));
						} else {
							itsCompletion.completed(true);
						}

						return fired;
					} else {
						return false;			//	No refresh needed.
					}
					
				}
			};

		coreSchedule(task, when);
		itsTask00 = task;
	}
	
	/**	Cancel this task. Synchronised on the inner basic task because
	  	we want to be sure that, once we've called cancel, the inner task
	  	cannot fire again. (Compare with {@link BlinkTask}, where we don't
	  	care much.)
	 */

	@Override
	public void cancel() {
		if (itsTask00 != null) {
			synchronized (itsTask00) {
				itsRunning = false;
				itsCompletion.completed(false);
			}
		}
	}
}
