//	$Id: FlashTaskTest.java,v e10460961dd6 2011/05/22 11:43:48 nick $
//	$Source: /Users/nick/workspace/MaxMSP/DEVELOPMENT_0/mxj-development/shado/java/unit-tests/net/loadbang/shadox/FlashTaskTest.java,v $

package net.loadbang.shadox;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import java.util.HashMap;
import java.util.Map;

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
public class FlashTaskTest {
	private Mockery itsContext = new JUnit4Mockery();
	
	@Test
	public void stub() { }

	@Ignore public void flashTaskCallsOnOff() throws Exception {
		final IRenderer renderer = itsContext.mock(IRenderer.class);
		DisplayTaskManager manager = new DisplayTaskManager(renderer, 10);
		final Frame f = manager.getMainFrame();
		final Map<String, Integer> map = new HashMap<String, Integer>();
		
		FlashTask task = new FlashTask(manager, 7) {
			@Override void flashOn(DisplayTaskManager.ScheduleTime cue) { map.put("ON", cue.getTime()); }
			@Override void flashOff(DisplayTaskManager.ScheduleTime cue) { map.put("OFF", cue.getTime()); }
		};
		
		itsContext.checking(new Expectations() {{
			exactly(2).of(renderer).render(f);
		}});
		
		task.schedule(manager.newTime(10));
		Thread.sleep(300);
		assertEquals((Integer) (map.get("ON") + 7), map.get("OFF"));
	}
	
	/**	TODO this doesn't really belong here: it's testing a property
		of the TaskManager. */

	@Ignore
	public void refreshTaskDoesNotDuplicateRefreshes() throws Exception {
		final IRenderer renderer = itsContext.mock(IRenderer.class);
		DisplayTaskManager manager = new DisplayTaskManager(renderer, 10);
		final Frame f = manager.getMainFrame();
		
		FlashTask task = new FlashTask(manager, 7) {
			@Override void flashOn(DisplayTaskManager.ScheduleTime cue) { }
			@Override void flashOff(DisplayTaskManager.ScheduleTime cue) { }
		};
		
		itsContext.checking(new Expectations() {{
			exactly(2).of(renderer).render(f);
		}});
		
		ScheduleTime t = manager.newTime(10);
		task.schedule(t);
		manager.schedule(new RefreshOnlyTask(), t);
		manager.schedule(new RefreshOnlyTask(), t.advance(7));
		Thread.sleep(300);
	}
	
	@Ignore
	public void pendingFlashTaskCanBeCancelled() throws Exception {
		final IRenderer renderer = itsContext.mock(IRenderer.class);
		DisplayTaskManager manager = new DisplayTaskManager(renderer, 10);		//	10msec clock.
		final Map<String, Integer> map = new HashMap<String, Integer>();
		
		FlashTask task = new FlashTask(manager, 1) {
			@Override void flashOn(DisplayTaskManager.ScheduleTime cue) { map.put("ON", cue.getTime()); }
			@Override void flashOff(DisplayTaskManager.ScheduleTime cue) { map.put("OFF", cue.getTime()); }
		};
		
		itsContext.checking(new Expectations() {{
			//	Task should cancel completely, so no render calls.
		}});
		
		task.schedule(10);				//	100msec in future
		task.cancel();
		Thread.sleep(500);
		
		assertNull("task on is bogus", map.get("ON"));
		assertNull("task off is bogus", map.get("OFF"));
	}
	
	@Ignore
	public void activeFlashTaskCanBeCancelled() throws Exception {
		final IRenderer renderer = itsContext.mock(IRenderer.class);
		DisplayTaskManager manager = new DisplayTaskManager(renderer, 10);		//	10msec clock.
		final Frame f = manager.getMainFrame();
		final Map<String, Integer> map = new HashMap<String, Integer>();
		
		FlashTask task = new FlashTask(manager, 100) {		//	1-second flash.
			@Override void flashOn(DisplayTaskManager.ScheduleTime cue) { map.put("ON", cue.getTime()); }
			@Override void flashOff(DisplayTaskManager.ScheduleTime cue) { map.put("OFF", cue.getTime()); }
		};
		
		itsContext.checking(new Expectations() {{
			ignoring(renderer).render(f);
		}});
		
		task.schedule(0);
		Thread.sleep(500);
		task.cancel();
		Thread.sleep(1500);
		
		assertNotNull("task on missing", map.get("ON"));
		assertNull("task off is bogus", map.get("OFF"));
	}
}
