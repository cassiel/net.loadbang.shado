//	$Id: RefreshOnlyTaskTest.java,v e10460961dd6 2011/05/22 11:43:48 nick $
//	$Source: /Users/nick/workspace/MaxMSP/DEVELOPMENT_0/mxj-development/shado/java/unit-tests/net/loadbang/shadox/RefreshOnlyTaskTest.java,v $

package net.loadbang.shadox;

import net.loadbang.shado.Frame;
import net.loadbang.shado.IRenderer;

import org.jmock.Expectations;
import org.jmock.Mockery;
import org.jmock.integration.junit4.JUnit4Mockery;
import org.junit.Ignore;
import org.junit.Test;

public class RefreshOnlyTaskTest {
	private Mockery itsContext = new JUnit4Mockery();
	
	@Test
	public void stub() { }

	/**	This is actually more a test of the TaskManager than the (almost
		empty) refresh task.
	
		@throws Exception
	 */

	@Ignore
	public void refresh() throws Exception {
		final IRenderer renderer = itsContext.mock(IRenderer.class);
		DisplayTaskManager manager = new DisplayTaskManager(renderer, 10);
		final Frame f = manager.getMainFrame();

		RefreshOnlyTask t = new RefreshOnlyTask();
		
		itsContext.checking(new Expectations() {{
			exactly(1).of(renderer).render(f);
		}});
		
		manager.schedule(t, 10);
		Thread.sleep(300);
	}
}
