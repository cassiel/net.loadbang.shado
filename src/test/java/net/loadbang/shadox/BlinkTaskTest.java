//	$Id: BlinkTaskTest.java,v e10460961dd6 2011/05/22 11:43:48 nick $
//	$Source: /Users/nick/workspace/MaxMSP/DEVELOPMENT_0/mxj-development/shado/java/unit-tests/net/loadbang/shadox/BlinkTaskTest.java,v $

package net.loadbang.shadox;

import java.util.HashMap;
import java.util.Map;

import net.loadbang.shado.Frame;
import net.loadbang.shado.IRenderer;

import org.jmock.Expectations;
import org.jmock.Mockery;
import org.jmock.integration.junit4.JMock;
import org.jmock.integration.junit4.JUnit4Mockery;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(JMock.class)
public class BlinkTaskTest {
	private Mockery itsContext = new JUnit4Mockery();
	
	@Test
	public void stub() { }

	@Ignore
	public void willBlinkMoreThanOnceAndCancel() throws Exception {
		final IRenderer renderer = itsContext.mock(IRenderer.class);
		DisplayTaskManager manager = new DisplayTaskManager(renderer, 10);
		final Frame f = manager.getMainFrame();
		final Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("X", 0);
		
		BlinkTask task = new BlinkTask(manager, 3, 4) {		//	Period 70msec
			@Override void blinkOn(DisplayTaskManager.ScheduleTime cue) {
				System.out.println("BLINK ON " + map.get("X") + " cue " + cue);
				map.put("X", map.get("X") + 1);
			}

			@Override void blinkOff(DisplayTaskManager.ScheduleTime cue) {
				System.out.println("BLINK OFF " + map.get("X") + " cue " + cue);
				if (map.get("X") == 3) {
					cancel();
				}
			}
		};
		
		itsContext.checking(new Expectations() {{
			exactly(6).of(renderer).render(f);
		}});
		
		task.schedule(1);
		Thread.sleep(300);
	}
}
