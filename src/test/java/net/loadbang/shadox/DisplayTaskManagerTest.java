//	$Id: DisplayTaskManagerTest.java,v e10460961dd6 2011/05/22 11:43:48 nick $
//	$Source: /Users/nick/workspace/MaxMSP/DEVELOPMENT_0/mxj-development/shado/java/unit-tests/net/loadbang/shadox/DisplayTaskManagerTest.java,v $

package net.loadbang.shadox;

import net.loadbang.shado.Frame;
import net.loadbang.shado.IRenderer;
import net.loadbang.shadox.DisplayTaskManager.ScheduleTime;

import org.jmock.Expectations;
import org.jmock.Mockery;
import org.jmock.integration.junit4.JMock;
import org.jmock.integration.junit4.JUnit4Mockery;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(JMock.class)
public class DisplayTaskManagerTest {
	private Mockery itsContext = new JUnit4Mockery();

	@Test
	public void stub() { }

	@Ignore
	public void bangTaskGetsCalled() throws Exception {
		final IBasicTask task = itsContext.mock(IBasicTask.class);
		final IRenderer renderer = itsContext.mock(IRenderer.class);
		
		DisplayTaskManager manager = new DisplayTaskManager(renderer, 10);
		final Frame f = manager.getMainFrame();

		//	The TaskManager should always (re)render after it's
		//	started or stopped the duty cycle of a task.
		itsContext.checking(new Expectations() {{
			one(task).bangThenRefresh(with(any(ScheduleTime.class))); will(returnValue(true));
			exactly(1).of(renderer).render(f);
		}});
		
		manager.schedule(task, manager.newTime(5));
		
		Thread.sleep(500);
	}
	
	public interface IBangTask_1 extends IBasicTask { }
	public interface IBangTask_2 extends IBasicTask { }
	
	@Ignore
	public void willNotDuplicateRenders() throws Exception {
		final IBangTask_1 task_A = itsContext.mock(IBangTask_1.class);
		final IBangTask_2 task_B = itsContext.mock(IBangTask_2.class);
		final IRenderer renderer = itsContext.mock(IRenderer.class);

		DisplayTaskManager manager = new DisplayTaskManager(renderer, 10);
		final Frame f = manager.getMainFrame();
		
		itsContext.checking(new Expectations() {{
			one(task_A).bangThenRefresh(with(any(ScheduleTime.class))); will(returnValue(true));
			one(task_B).bangThenRefresh(with(any(ScheduleTime.class))); will(returnValue(true));
			exactly(1).of(renderer).render(f);
		}});
		
		DisplayTaskManager.ScheduleTime t = manager.newTime(1);
		manager.schedule(task_A, t);
		manager.schedule(task_B, t);
		
		Thread.sleep(500);
	}
	
	@Ignore
	public void willFireThingsInThePast() throws Exception {
		final IBangTask_1 task_A = itsContext.mock(IBangTask_1.class);
		final IBangTask_2 task_B = itsContext.mock(IBangTask_2.class);
		final IRenderer renderer = itsContext.mock(IRenderer.class);

		DisplayTaskManager manager = new DisplayTaskManager(renderer, 10);
		final Frame f = manager.getMainFrame();
		
		//	The TaskManager should always (re)render after it's
		//	started or stopped the duty cycle of a task.
		itsContext.checking(new Expectations() {{
			one(task_A).bangThenRefresh(with(any(ScheduleTime.class))); will(returnValue(true));
			one(task_B).bangThenRefresh(with(any(ScheduleTime.class))); will(returnValue(true));
			exactly(2).of(renderer).render(f);
		}});
		

		manager.schedule(task_B, 60);		//	600msec in - to keep worker alive.
		Thread.sleep(500);
		manager.schedule(task_A, 1);
		Thread.sleep(500);
	}
}
