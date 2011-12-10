//	$Id$
//	$Source$

package net.loadbang.shado;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import net.loadbang.shado.types.LampState;

import org.jmock.Expectations;
import org.jmock.Mockery;
import org.jmock.integration.junit4.JMock;
import org.jmock.integration.junit4.JUnit4Mockery;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(JMock.class)
public class ViewPortTest {
	private Mockery itsContext = new JUnit4Mockery();
	
	@Test
	public void canCropOnBlock() {
		IPressRouter block = new Block(4, 4).fill(LampState.ON);
		IRenderable cropped = new ViewPort(block, 0, 1, 4, 2);
		
		assertEquals("above/1", LampState.THRU, cropped.getLamp(0, 0));
		assertEquals("within/1", LampState.ON, cropped.getLamp(0, 1));
		assertEquals("within/2", LampState.ON, cropped.getLamp(3, 2));
		assertEquals("above/1", LampState.THRU, cropped.getLamp(3, 3));
	}
	
	@Test
	public void canMoveWindow() {
		IPressRouter block = new Block(4, 4).fill(LampState.ON);
		ViewPort cropped = new ViewPort(block, 0, 0, 2, 2);
		
		assertEquals("TL/1", LampState.ON, cropped.getLamp(0, 0));
		assertEquals("BR/1", LampState.THRU, cropped.getLamp(3, 3));
		
		cropped.setX(2);
		
		assertEquals("TL/2", LampState.THRU, cropped.getLamp(0, 0));
		assertEquals("BR/2", LampState.THRU, cropped.getLamp(3, 3));

		cropped.setY(2);
		
		assertEquals("TL/3", LampState.THRU, cropped.getLamp(0, 0));
		assertEquals("BR/3", LampState.ON, cropped.getLamp(3, 3));
	}
	
	@Test
	public void willMapPressToLocalCoordinates() {
		final IPressable pressable = itsContext.mock(IPressable.class);

		itsContext.checking(new Expectations() {{
			//	Expect a press at (0, 0):
			one(pressable).press(0, 0, 1); will(returnValue(true));
		}});
		
		IPressRouter b = new Block(2, 2);
		
		ViewPort w =
			new ViewPort(b, 1, 0, 1, 1) {
				@Override public boolean press(int x, int y, int how) {
					return pressable.press(x, y, how);
				}
			};
		
		assertNull("window press out of range", w.routePress00(0, 0));
		assertNotNull("window press in range", w.routePress00(1, 0));
	}
	
	@Test
	public void willCorrectlyPassPressesToContents() {
		final IPressable pressable = itsContext.mock(IPressable.class);

		itsContext.checking(new Expectations() {{
			//	Expect a press at (1, 0):
			one(pressable).press(1, 0, 1); will(returnValue(true));
		}});
		
		//	We'll expect a press to the inner block:
		IPressRouter b = new Block(2, 2) {
			@Override public boolean press(int x, int y, int how) {
				return pressable.press(x, y, how);
			}
		};
		
		//	The port is at X=1:
		ViewPort w =
			new ViewPort(b, 1, 0, 1, 1) {
				@Override public boolean press(int x, int y, int how) {
					return false;
				}
			};
		
		assertNull("port press out of range", w.routePress00(0, 0));
		assertNotNull("port press in range", w.routePress00(1, 0));
	}
	
	@Test
	public void portWillNotPassFrameStampToContent() throws Exception {
		final IPressable pressable = itsContext.mock(IPressable.class);

		itsContext.checking(new Expectations() {{
			//	only expect the bottom item to route a click:
			one(pressable).press(0, 0, 1); will(returnValue(true));
		}});
		
		IPressRouter b = new Block(1, 1) {
			@Override public boolean press(int x, int y, int how) {
				return pressable.press(x, y, how);
			}
		};
		
		ViewPort p = new ViewPort(b, 0, 0, 1, 1);
		
		Frame f = new Frame();
		
		f.add(p, 0, 0);

		assertNotNull("press", f.routePress00(0, 0));
	}
	
	@Test
	public void pressEventsCorrelateWhenViewPortMoves() {
		final IPressable pressable = itsContext.mock(IPressable.class);

		itsContext.checking(new Expectations() {{
			one(pressable).press(0, 0, 1); will(returnValue(true));
			one(pressable).press(0, 0, 0); will(returnValue(true));
		}});
		
		IPressRouter b = new Block(2, 2) {
			@Override public boolean press(int x, int y, int how) {
				return pressable.press(x, y, how);
			}
		};
		
		ViewPort p = new ViewPort(b, 0, 0, 2, 2);
		
		PressManager mgr = new PressManager(p);
		
		//	press, with 2x2 port directly over block:
		mgr.press(0, 0, 1);
		
		//	move the port:
		p.setX(p.getX() + 1);
		
		//	release: should still be at (0, 0).
		mgr.press(0, 0, 0);
		
		//	press again (ignored, since it's now outside the port,
		//	even though a hidden part of the block is here):
		mgr.press(0, 0, 1);
	}
}
