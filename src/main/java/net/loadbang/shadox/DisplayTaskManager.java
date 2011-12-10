//	$Id$
//	$Source$

package net.loadbang.shadox;

import java.util.AbstractQueue;
import java.util.concurrent.PriorityBlockingQueue;

import net.loadbang.shado.IRenderer;
import net.loadbang.shado.exn.OperationException;

/**	A TaskManager combines a renderer with a simple
	scheduler for doing tasks like flashing, blinking
	and animation.

	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
 */

public class DisplayTaskManager implements Runnable {
	/** An abstract(-ish) representation of a time in the future, for scheduling. */
	public class ScheduleTime implements Comparable<ScheduleTime> {
		private int itsTime;
	
		/**	Private constructor: control creation of schedule times,
		 	based on current clock.
		  */

		private ScheduleTime(int time) { 
			itsTime = time;
		}
		
		public int compareTo(ScheduleTime o) {
			return new Integer(itsTime).compareTo(o.itsTime);
		}
	
		public int getTime() {
			return itsTime;
		}
	
		public ScheduleTime advance(int duration) {
			return new ScheduleTime(itsTime + duration);
		}
		
		@Override
		public String toString() { return "t." + itsTime; }
	}

	private IRenderer itsRenderer;
	private XFrame itsMainFrame;
	private int itsTickIntervalMSec;
	
	/**	Current local clock in ticks. */
	private int itsClock;

	/**	Generate unique stamps, to guarantee FIFO for simultaneous events
		in our scheduler queue. (I now have to remember why that matters;
		it was obviously important at the time.) */

	private int itsStamp;
	
	class TaskEntry implements Comparable<TaskEntry> {
		private ScheduleTime itsScheduleTime;
		private int itsCreationStamp;
		private IBasicTask itsTask;

		TaskEntry(ScheduleTime scheduleTime, int creationStamp, IBasicTask task) {
			itsScheduleTime = scheduleTime;
			itsCreationStamp = creationStamp;
			itsTask = task;
		}

		public int compareTo(TaskEntry o) {
			if (itsScheduleTime.compareTo(o.itsScheduleTime) == 0) {
				return new Integer(itsCreationStamp).compareTo(o.itsCreationStamp);
			} else {
				return itsScheduleTime.compareTo(o.itsScheduleTime);
			}
		}
	}
	
	private AbstractQueue<TaskEntry> itsPendingTasks;

	public DisplayTaskManager(IRenderer renderer, int tickIntervalMSec) {
		itsRenderer = renderer;
		itsMainFrame = new XFrame(this);
		itsTickIntervalMSec = tickIntervalMSec;
		itsPendingTasks = new PriorityBlockingQueue<TaskEntry>();
		
		Thread t = new Thread(this, "shado worker");
		t.setDaemon(true);
		t.setPriority(Thread.MIN_PRIORITY);
		System.out.println("STARTING WORKER " + t);
		t.start();
	}

	/**	Clear the system queue (has no effect on the worker thread). */
	
	public void clear() {
		itsPendingTasks.clear();
	}
	
	/**	Return the outermost main frame (the one the task manager renders
		on any scheduled change).
		
	 	@return the outermost frame
	 */

	public XFrame getMainFrame() {
		return itsMainFrame;
	}

	/** Generate a unique, highest stamp - used to (sub-)sort items in
	 	the worker queue.

	 	@return a new, highest, stamp
	 */

	private int newStamp() {
		return itsStamp++;
	}
	
	/**	Create a ScheduleTime. TODO: we're assuming atomic update
	 	to the clock (the worker might tickle it during our call).
	 	
	 	@param ticksInFuture how far in the future to create the time
	 */

	public ScheduleTime newTime(int ticksInFuture) {
		return new ScheduleTime(itsClock + ticksInFuture);
	}

	/**	Schedule a task, for some number of ticks (such as none!) in the future.
	 	This version takes a ScheduleTime because we might want to schedule
	 	several tasks on exactly the same clock, without the risk of the
	 	worker thread ticking between them.

	 	@param task the task to schedule
	 	@param when the timepoint schedule the task
	 */

	public void schedule(IBasicTask task, ScheduleTime when) {
		itsPendingTasks.add(new TaskEntry(when, newStamp(), task));
	}
	
	/**	Schedule a task, for some number of ticks (such as none!) in the future.
	 	If this is the first task in an empty queue, start the worker.

	 	@param task the task to schedule
	 	@param ticksInFuture how many ticks in the future to schedule the task
	 */
	public void schedule(IBasicTask task, int ticksInFuture) {
		schedule(task, newTime(ticksInFuture));
	}

	/**	Render the topmost frame. We don't expose this to the outside world
	 	because we want clients to drop in scheduler tasks to do refreshes.
	 */

	private void render() {
		try {
			itsRenderer.render(itsMainFrame);
		} catch (OperationException e) {
			e.printStackTrace();
		}
	}

	/**	Do a slice of work. Operate on all entries with the current clock time or
	 	earlier. */

	private void workSlice() {
		boolean going = true;
		boolean needToRender = false;
		
		//System.out.println("t=" + Thread.currentThread() + ": CLOCKING at " + itsClock + " queueSize=" + itsPendingTasks.size());

		while (going) {
			TaskEntry e00 = itsPendingTasks.peek();
			
			if (e00 == null) {
				going = false;
			} else if (e00.itsScheduleTime.getTime() <= itsClock) {
				itsPendingTasks.remove(e00);
				IBasicTask t = e00.itsTask;
				//System.out.println("INTO TASK " + t);
				boolean renderThis = t.bangThenRefresh(e00.itsScheduleTime);
				needToRender = needToRender || renderThis;
			} else {
				//System.out.println("FINISHING FOR NOW - next clock at " + e00.itsScheduleTime.getTime());
				going = false;
			}
		}

		if (needToRender) { render(); }
		itsClock++;
	}

	public void run() {
		while (true) {
			workSlice();

			try {
				Thread.sleep(itsTickIntervalMSec);
			} catch (InterruptedException e) { }
		}
	}
}
