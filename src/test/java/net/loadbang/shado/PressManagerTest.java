//	$Id$
//	$Source$

package net.loadbang.shado;

import net.loadbang.shado.IPressRouter;
import net.loadbang.shado.IPressable;
import net.loadbang.shado.PressManager;
import net.loadbang.shado.IPressRouter.PressRouteResult;

import org.jmock.Expectations;
import org.jmock.Mockery;
import org.jmock.integration.junit4.JMock;
import org.jmock.integration.junit4.JUnit4Mockery;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(JMock.class)
public class PressManagerTest {
	private Mockery itsContext = new JUnit4Mockery();
	
	@Test
	public void doesPressAndRelease() {
		final IPressRouter router = itsContext.mock(IPressRouter.class);
		final IPressable pressable = itsContext.mock(IPressable.class);
		PressManager mgr = new PressManager(router);
		
		itsContext.checking(new Expectations() {{
			one(router).routePress00(0, 0);
			will(returnValue(new PressRouteResult(pressable, 3, 4)));
			
			one(pressable).press(3, 4, 0); will(returnValue(true));
		}});
		
		mgr.press(0, 0, 1);
		mgr.press(0, 0, 0);
	}
	
	@Test
	public void willDiscardRelease() {
		final IPressRouter router = itsContext.mock(IPressRouter.class);
		PressManager mgr = new PressManager(router);
		
		itsContext.checking(new Expectations() {{
			one(router).routePress00(0, 0);
			will(returnValue(null));
		}});
		
		mgr.press(0, 0, 1);
		mgr.press(0, 0, 0);
	}
	
	@Test
	public void willFilterRepeatedPresses() {
		final IPressRouter router = itsContext.mock(IPressRouter.class);
		final IPressable pressable = itsContext.mock(IPressable.class);
		PressManager mgr = new PressManager(router);
		
		itsContext.checking(new Expectations() {{
			one(router).routePress00(0, 0);
			will(returnValue(new PressRouteResult(pressable, 3, 4)));
			
			one(pressable).press(3, 4, 0); will(returnValue(true));

			one(router).routePress00(0, 0);
			will(returnValue(new PressRouteResult(pressable, 5, 6)));

			one(pressable).press(5, 6, 0); will(returnValue(true));
		}});
		
		mgr.press(0, 0, 1);
		mgr.press(0, 0, 1);
		mgr.press(0, 0, 0);
	}
}
