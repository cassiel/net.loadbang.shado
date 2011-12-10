//	$Id: SequenceTaskTest.java,v e10460961dd6 2011/05/22 11:43:48 nick $
//	$Source: /Users/nick/workspace/MaxMSP/DEVELOPMENT_0/mxj-development/shado/java/unit-tests/net/loadbang/shadox/SequenceTaskTest.java,v $

package net.loadbang.shadox;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.List;

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
public class SequenceTaskTest {
	private Mockery itsContext = new JUnit4Mockery();
	
	@Test
	public void stub() { }

	@Ignore
	public void sequenceFiresInOrder() throws Exception {
		final IRenderer renderer = itsContext.mock(IRenderer.class);
		final ICompletion completion = itsContext.mock(ICompletion.class);
		DisplayTaskManager manager = new DisplayTaskManager(renderer, 10);
		final Frame f = manager.getMainFrame();
		final List<Integer> list = new ArrayList<Integer>();
		
		SequenceTask task = new SequenceTask(manager, 10, 1, completion) {
			@Override void fire(DisplayTaskManager.ScheduleTime cue, int n) { list.add(n); }
		};
		
		itsContext.checking(new Expectations() {{
			exactly(10).of(renderer).render(f);
			one(completion).completed(true);
		}});
		
		task.schedule(manager.newTime(10));
		Thread.sleep(500);
		
		for (int i = 0; i < 10; i++) {
			assertEquals("list item " + i, new Integer(i), list.get(i));
		}
	}
	
	@Ignore
	public void emptySequenceWillNotFire() throws Exception {
		final IRenderer renderer = itsContext.mock(IRenderer.class);
		final ICompletion completion = itsContext.mock(ICompletion.class);
		DisplayTaskManager manager = new DisplayTaskManager(renderer, 10);
		
		SequenceTask task = new SequenceTask(manager, 0, 1, completion) {
			@Override void fire(DisplayTaskManager.ScheduleTime cue, int n) { }
		};
		
		itsContext.checking(new Expectations() {{
			never(renderer).render(with(any(XFrame.class)));
		}});
		
		task.schedule(manager.newTime(10));
		Thread.sleep(300);
	}
}
