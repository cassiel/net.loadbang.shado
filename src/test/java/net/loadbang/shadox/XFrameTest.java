//	$Id: XFrameTest.java,v e10460961dd6 2011/05/22 11:43:48 nick $
//	$Source: /Users/nick/workspace/MaxMSP/DEVELOPMENT_0/mxj-development/shado/java/unit-tests/net/loadbang/shadox/XFrameTest.java,v $

package net.loadbang.shadox;

import static org.junit.Assert.assertEquals;
import net.loadbang.shado.Block;
import net.loadbang.shado.Frame;
import net.loadbang.shado.IPressRouter;
import net.loadbang.shado.IRenderer;
import net.loadbang.shado.types.LampState;

import org.jmock.Expectations;
import org.jmock.Mockery;
import org.jmock.integration.junit4.JMock;
import org.jmock.integration.junit4.JUnit4Mockery;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(JMock.class)
public class XFrameTest {
	private Mockery itsContext = new JUnit4Mockery();
	
	@Test
	public void stub() { }

	@Ignore
	public void canCancelBlink() throws Exception {
		IPressRouter r = new Frame();
		final IRenderer renderer = itsContext.mock(IRenderer.class);
		DisplayTaskManager manager = new DisplayTaskManager(renderer, 10);
		final XFrame f = manager.getMainFrame();

		itsContext.checking(new Expectations() {{
			exactly(2).of(renderer).render(f);
		}});
		
		f.add(r, 0, 0);
		f.blink(r, 10, 10, null).noBlink(r);
		
		Thread.sleep(300);
	}
	
	@Ignore
	public void canReplaceFlash() throws Exception {
		IPressRouter r = new Frame();
		final IRenderer renderer = itsContext.mock(IRenderer.class);
		DisplayTaskManager manager = new DisplayTaskManager(renderer, 10);		//	10msec clock.
		final XFrame f = manager.getMainFrame();

		itsContext.checking(new Expectations() {{
			//	No renders.
		}});
		
		f.add(r, 0, 0);
		f.flash(r, 10, manager.newTime(2));			//	20 msec in future.
		f.flash(r, 10, manager.newTime(200));		//	2 sec in future.
		
		Thread.sleep(300);
	}
	
	@Ignore
	public void canScrollPositive() throws Exception {
		Block b = new Block(1, 1).fill(LampState.ON);
		final IRenderer renderer = itsContext.mock(IRenderer.class);
		DisplayTaskManager manager = new DisplayTaskManager(renderer, 10);
		final XFrame f = manager.getMainFrame();
		final ICompletion completion = itsContext.mock(ICompletion.class);

		itsContext.checking(new Expectations() {{
			ignoring(renderer).render(f);
			one(completion).completed(true);
		}});
		
		f.add(b, 0, 0);
		assertEquals(LampState.ON, f.getLamp(0, 0));
		
		f.scrollY(b, 3, 1, null, completion);
		Thread.sleep(300);

		assertEquals(LampState.ON, f.getLamp(0, 3));
		assertEquals(LampState.THRU, f.getLamp(0, 0));
		
	}
	
	@Ignore
	public void canScrollNegative() throws Exception {
		Block b = new Block(1, 1).fill(LampState.ON);
		final IRenderer renderer = itsContext.mock(IRenderer.class);
		DisplayTaskManager manager = new DisplayTaskManager(renderer, 10);
		final XFrame f = manager.getMainFrame();
		final ICompletion completion = itsContext.mock(ICompletion.class);

		itsContext.checking(new Expectations() {{
			ignoring(renderer).render(f);
			one(completion).completed(true);
		}});
		
		f.add(b, 0, 3);
		assertEquals(LampState.ON, f.getLamp(0, 3));
		
		f.scrollY(b, 0, 1, null, completion);
		Thread.sleep(300);

		assertEquals(LampState.THRU, f.getLamp(0, 3));
		assertEquals(LampState.ON, f.getLamp(0, 0));		
	}
	
	public interface ICompletion_1 extends ICompletion { }
	public interface ICompletion_2 extends ICompletion { }
	
	@Ignore
	public void canCancelScroll() throws Exception {
		Block b = new Block(1, 1).fill(LampState.ON);
		final IRenderer renderer = itsContext.mock(IRenderer.class);
		DisplayTaskManager manager = new DisplayTaskManager(renderer, 10);
		final XFrame f = manager.getMainFrame();
		final ICompletion completion1 = itsContext.mock(ICompletion_1.class);
		final ICompletion completion2 = itsContext.mock(ICompletion_2.class);

		itsContext.checking(new Expectations() {{
			ignoring(renderer).render(f);
			one(completion1).completed(false);
			one(completion2).completed(true);
		}});
		
		f.add(b, 0, 0);
		assertEquals(LampState.ON, f.getLamp(0, 0));
		
		f.scrollY(b, 100, 10, null, completion1);
		Thread.sleep(300);
		f.noScroll(b);			//	Cancel the down-scroll part way through. (Would be done implicitly.)
		f.scrollY(b, 0, 10, null, completion2);
		Thread.sleep(400);

		assertEquals(LampState.THRU, f.getLamp(0, 1));
		assertEquals(LampState.ON, f.getLamp(0, 0));
	}
}
