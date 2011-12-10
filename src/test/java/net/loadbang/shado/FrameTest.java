//	$Id: FrameTest.java,v e10460961dd6 2011/05/22 11:43:48 nick $
//	$Source: /Users/nick/workspace/MaxMSP/DEVELOPMENT_0/mxj-development/shado/java/unit-tests/net/loadbang/shado/FrameTest.java,v $

package net.loadbang.shado;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.fail;
import net.loadbang.shado.exn.OperationException;
import net.loadbang.shado.exn.RangeException;
import net.loadbang.shado.types.LampState;
import net.loadbang.shado.types.LampStateTest;
import net.loadbang.shado.util.TestingManifest;

import org.jmock.Expectations;
import org.jmock.Mockery;
import org.jmock.integration.junit4.JMock;
import org.jmock.integration.junit4.JUnit4Mockery;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(JMock.class)
public class FrameTest {
	private Mockery itsContext = new JUnit4Mockery();

	@Test(expected=RangeException.class)
	public void frameChecksItemRange() throws Exception {
		Frame f = new Frame();
		f.get(0);
	}
	
	@Test
	public void canAddToBottom() throws Exception {
		Frame f = new Frame();
		Block b1 = new Block(0, 0);
		Block b2 = new Block(0, 0);
		
		f.add(b1, 0, 0);
		f.add(b2, 0, 0);
		
		assertSame("0", f.get(0).getPressRouter(), b1);
		assertSame("1", f.get(1).getPressRouter(), b2);
	}
	
	@Test(expected=OperationException.class)
	public void cannotAddSameItemTwice() throws Exception {
		Frame f = new Frame();
		Block b1 = new Block(0, 0);
		
		f.add(b1, 0, 0).add(b1, 0, 0);
	}
	
	@Test
	public void canRaise() throws Exception {
		Frame f = new Frame();
		Block b1 = new Block(0, 0);
		Block b2 = new Block(0, 0);
		Block b3 = new Block(0, 0);
		
		f.add(b1, 0, 0);
		f.add(b2, 0, 0);
		f.add(b3, 0, 0);
		
		f.top(b2);
		
		assertSame("2", f.get(2).getPressRouter(), b2);
		assertSame("0", f.get(0).getPressRouter(), b1);
		assertSame("1", f.get(1).getPressRouter(), b3);
	}
	
	@Test
	public void emptyFrameWorks() throws Exception {
		Frame f = new Frame();
		LampStateTest.assertClose("intermediate lamp", LampState.THRU, f.getLamp(0, 0));
		assertEquals("rendered lamp", 0f, f.getRenderedLamp(0, 0), TestingManifest.JUNIT_DELTA);
	}
	
	@Test
	public void frameWithFlipWorks() throws Exception {
		Frame f = new Frame();

		Block b = new Block(1, 1);
		b.fill(LampState.FLIP);
		f.add(b, 0, 0);
		
		LampStateTest.assertClose("intermediate lamp", LampState.FLIP, f.getLamp(0, 0));
		assertEquals("rendered lamp", 1f, f.getRenderedLamp(0, 0), TestingManifest.JUNIT_DELTA);
	}

	@Test
	public void frameWithDoubleFlipWorks() throws Exception {
		Frame f = new Frame();

		Block b1 = new Block(1, 1);
		b1.fill(LampState.FLIP);
		f.add(b1, 0, 0);
		
		Block b2 = new Block(1, 1);
		b2.fill(LampState.FLIP);
		f.add(b2, 0, 0);
		
		LampStateTest.assertClose("intermediate lamp", LampState.THRU, f.getLamp(0, 0));
		assertEquals("rendered lamp", 0f, f.getRenderedLamp(0, 0), TestingManifest.JUNIT_DELTA);
	}
	
	@Test
	public void frameCanUseBlockTwiceViaViewPorts() throws Exception {
		Frame f = new Frame();
		Block b = new Block(1, 1);		
		b.fill(LampState.FLIP);
		
		ViewPort p1 = new ViewPort(b, 0, 0, 1, 1);
		ViewPort p2 = new ViewPort(b, 0, 0, 1, 1);
		
		f.add(p1, 0, 0);
		LampStateTest.assertClose("1", LampState.FLIP, f.getLamp(0, 0));

		f.add(p2, 0, 0);
		LampStateTest.assertClose("2", LampState.THRU, f.getLamp(0, 0));
}
	
	@Test
	public void frameOffsetsBlockProperly() throws Exception {
		Frame f = new Frame();

		Block b = new Block(1, 1);
		b.fill(LampState.ON);
		f.add(b, 1, 0);
		
		LampStateTest.assertClose("intermediate lamp", LampState.THRU, f.getLamp(0, 0));
		assertEquals("rendered lamp", 0f, f.getRenderedLamp(0, 0), TestingManifest.JUNIT_DELTA);
		
		LampStateTest.assertClose("intermediate lamp", LampState.ON, f.getLamp(1, 0));
		assertEquals("rendered lamp", 1f, f.getRenderedLamp(1, 0), TestingManifest.JUNIT_DELTA);
	}
	
	@Test
	public void doubleFrameOffset() throws Exception {
		Frame inner = new Frame();
		
		Block b = new Block(1, 1);
		b.fill(LampState.ON);
		inner.add(b, 1, 1);
		
		Frame outer = new Frame();
		outer.add(inner, 1, 1);

		LampStateTest.assertClose("0/0", LampState.THRU, outer.getLamp(0, 0));
		LampStateTest.assertClose("1/1", LampState.THRU, outer.getLamp(1, 1));
		LampStateTest.assertClose("2/2", LampState.ON, outer.getLamp(2, 2));
		LampStateTest.assertClose("3/3", LampState.THRU, outer.getLamp(3, 3));
	}

	@Test
	public void cancelFrameOffset() throws Exception {
		Frame inner = new Frame();
		
		Block b = new Block(1, 1);
		b.fill(LampState.ON);
		inner.add(b, 1, 1);
		
		Frame outer = new Frame();
		outer.add(inner, -1, -1);

		LampStateTest.assertClose("0/0", LampState.ON, outer.getLamp(0, 0));
		LampStateTest.assertClose("1/1", LampState.THRU, outer.getLamp(1, 1));
	}
	
	@Test
	public void addsToTop() throws Exception {
		Frame f = new Frame();

		Block b1 = new Block(1, 1);
		b1.fill(LampState.ON);
		f.add(b1, 0, 0);
		
		Block b2 = new Block(1, 1);
		b2.fill(LampState.OFF);
		f.add(b2, 0, 0);
		
		LampStateTest.assertClose("top", LampState.OFF, f.getLamp(0, 0));
	}
	
	@Test
	public void canRemoveFromTop() throws Exception {
		Frame f = new Frame();

		Block b1 = new Block(1, 1);
		Block b2 = new Block(1, 1);
		f.add(b1, 0, 0).add(b2, 0, 0);
		
		f.show(b1);
		f.remove(b1);
		
		try {
			f.show(b1);
			fail("show of removed bloc");
		} catch (OperationException _) { }
		
		f.show(b2);
		assertSame("remove", b2, f.get(0).getPressRouter());
	}
	
	@Test
	public void canRemoveFromBottom() throws Exception {
		Frame f = new Frame();

		Block b1 = new Block(1, 1);
		Block b2 = new Block(1, 1);
		f.add(b1, 0, 0).add(b2, 0, 0);
		
		f.show(b2);
		f.remove(b2);
		
		try {
			f.show(b2);
			fail("show of removed bloc");
		} catch (OperationException _) { }
		
		f.show(b1);
		assertSame("remove", b1, f.get(0).getPressRouter());
	}
	
	@Test(expected=OperationException.class)
	public void complainsIfStampNotFound() throws Exception {
		Frame f = new Frame();
		Frame other = new Frame();

		Block b = new Block(1, 1);
		other.add(b, 0, 0);
		
		f.top(b);
	}

	@Test
	public void bringsTopToTop() throws Exception {
		Frame f = new Frame();

		Block b1 = new Block(1, 1);
		b1.fill(LampState.ON);
		f.add(b1, 0, 0);
		
		Block b2 = new Block(1, 1);
		b1.fill(LampState.OFF);
		f.add(b2, 0, 0);
		
		f.top(b2);
		
		LampStateTest.assertClose("top", LampState.OFF, f.getLamp(0, 0));
	}

	@Test
	public void bringsBottomToTop() throws Exception {
		Frame f = new Frame();

		Block b1 = new Block(1, 1);
		b1.fill(LampState.ON);
		f.add(b1, 0, 0);
		
		Block b2 = new Block(1, 1);
		f.add(b2, 0, 0);
		
		f.top(b1);
		
		LampStateTest.assertClose("top", LampState.ON, f.getLamp(0, 0));
	}

	@Test
	public void sendsTopToBottom() throws Exception {
		Frame f = new Frame();

		Block b1 = new Block(1, 1);
		b1.fill(LampState.ON);
		f.add(b1, 0, 0);
		
		Block b2 = new Block(1, 1);
		f.add(b2, 0, 0);
		
		f.bottom(b2);
		
		LampStateTest.assertClose("top", LampState.ON, f.getLamp(0, 0));
	}
	
	@Test
	public void belowToMiddle() throws Exception {
		Frame f = new Frame();
		Block b1 = new Block(1, 1);
		Block b2 = new Block(1, 1);
		Block b3 = new Block(1, 1);
		
		f.add(b1, 0, 0).add(b2, 0, 0).add(b3, 0, 0);
		
		//	b3 is top: move it below b2.
		f.below(b3, b2);
		assertSame(b3, f.get(1).getPressRouter());
		assertSame(b2, f.get(2).getPressRouter());
	}
	
	@Test
	public void belowToBottom() throws Exception {
		Frame f = new Frame();
		Block b1 = new Block(1, 1);
		Block b2 = new Block(1, 1);
		Block b3 = new Block(1, 1);
		
		f.add(b1, 0, 0).add(b2, 0, 0).add(b3, 0, 0);
		
		//	b2 is middle: move it below b1.
		f.below(b2, b1);
		assertSame(b2, f.get(0).getPressRouter());
		assertSame(b1, f.get(1).getPressRouter());
	}
	
	@Test
	public void aboveToMiddle() throws Exception {
		Frame f = new Frame();
		Block b1 = new Block(1, 1);
		Block b2 = new Block(1, 1);
		Block b3 = new Block(1, 1);
		
		f.add(b1, 0, 0).add(b2, 0, 0).add(b3, 0, 0);
		
		//	b1 is bottom: move it above b2.
		f.above(b1, b2);
		assertSame(b2, f.get(0).getPressRouter());
		assertSame(b1, f.get(1).getPressRouter());
	}
	
	@Test
	public void aboveToTop() throws Exception {
		Frame f = new Frame();
		Block b1 = new Block(1, 1);
		Block b2 = new Block(1, 1);
		Block b3 = new Block(1, 1);
		
		f.add(b1, 0, 0).add(b2, 0, 0).add(b3, 0, 0);
		
		//	b2 is middle: move it above b3.
		f.above(b2, b3);
		assertSame(b2, f.get(2).getPressRouter());
		assertSame(b3, f.get(1).getPressRouter());
	}
	
	@Test
	public void canGetXAndY() throws Exception {
		Frame f = new Frame();
		Block b = new Block(1, 1);
		f.add(b, 2, 3);
		
		assertEquals(2, f.getX(b));
		assertEquals(3, f.getY(b));
		
		f.moveBy(b, +2, -7);

		assertEquals(4, f.getX(b));
		assertEquals(-4, f.getY(b));
	}
	
	@Test
	public void moveToWorks() throws Exception {
		Frame f = new Frame();

		Block b = new Block(1, 1);
		b.fill(LampState.ON);
		f.add(b, 0, 0);
		
		f.moveTo(b, 1, 0);
		
		LampStateTest.assertClose("moveTo", LampState.ON, f.getLamp(1, 0));
	}

	@Test
	public void moveByWorks() throws Exception {
		Frame f = new Frame();

		Block b = new Block(1, 1);
		b.fill(LampState.ON);
		f.add(b, 0, 0);
		
		f.moveBy(b, 1, 0);
		LampStateTest.assertClose("moveBy/1", LampState.ON, f.getLamp(1, 0));
		
		f.moveBy(b, -1, 1);
		LampStateTest.assertClose("moveBy/2", LampState.ON, f.getLamp(0, 1));
	}
	
	@Test
	public void hideAndShow() throws Exception {
		Frame f = new Frame();

		Block b1 = new Block(1, 1);
		b1.fill(LampState.OFF);
		f.add(b1, 0, 0);

		Block b2 = new Block(1, 1);
		b2.fill(LampState.ON);
		f.add(b2, 0, 0);
		
		LampStateTest.assertClose("hide/show", LampState.ON, f.getLamp(0, 0));
		
		f.hide(b2);
		LampStateTest.assertClose("hide/show", LampState.OFF, f.getLamp(0, 0));
		
		f.hide(b1);
		LampStateTest.assertClose("hide/show", LampState.THRU, f.getLamp(0, 0));
		
		f.show(b2);
		LampStateTest.assertClose("hide/show", LampState.ON, f.getLamp(0, 0));

		f.top(b1);		//	No effect to render
		LampStateTest.assertClose("hide/show", LampState.ON, f.getLamp(0, 0));

		f.show(b1);
		LampStateTest.assertClose("hide/show", LampState.OFF, f.getLamp(0, 0));
	}
	
	public interface IP1 extends IPressable { };
	public interface IP2 extends IPressable { };
	
	@Test
	public void willRouteClicksToContents() throws Exception {
		final IP1 pressable1 = itsContext.mock(IP1.class);
		final IP2 pressable2 = itsContext.mock(IP2.class);

		itsContext.checking(new Expectations() {{
			//	Both pressables get clicked at (0, 0).
			one(pressable1).press(0, 0, 1); will(returnValue(true));
			one(pressable2).press(0, 0, 1); will(returnValue(true));
		}});
		
		IPressRouter b1 = new Block(1, 1) {
			@Override public boolean press(int x, int y, int how) {
				return pressable1.press(x, y, how);
			}
		};
		
		IPressRouter b2 = new Block(1, 1) {
			@Override public boolean press(int x, int y, int how) {
				return pressable2.press(x, y, how);
			}
		};
		
		Frame f = new Frame();
		
		f.add(b1, 0, 0);
		f.add(b2, 1, 0);

		assertNull("window press out of range", f.routePress00(0, 1));
		assertNotNull("press 1", f.routePress00(0, 0));
		assertNotNull("press 2", f.routePress00(1, 0));
	}
	
	@Test
	public void upperPressWillMaskLowerContent() throws Exception {
		final IP1 pressable1 = itsContext.mock(IP1.class);
		final IP2 pressable2 = itsContext.mock(IP2.class);

		itsContext.checking(new Expectations() {{
			//	only expect the top item to route a click:
			one(pressable2).press(with(any(int.class)), with(any(int.class)), with(any(int.class)));
			will(returnValue(true));
		}});
		
		IPressRouter b1 = new Block(1, 1) {
			@Override public boolean press(int x, int y, int how) {
				return pressable1.press(x, y, how);
			}
		};
		
		IPressRouter b2 = new Block(1, 1) {
			@Override public boolean press(int x, int y, int how) {
				return pressable2.press(x, y, how);
			}
		};
		
		Frame f = new Frame();
		
		f.add(b1, 0, 0);
		f.add(b2, 0, 0);		//	b2 on top.

		assertNotNull("press", f.routePress00(0, 0));
	}
	
	@Test
	public void upperPressCanPuntToLowerContent() throws Exception {
		final IPressable pressable1 = itsContext.mock(IPressable.class);

		itsContext.checking(new Expectations() {{
			//	only expect the bottom item to route a click:
			one(pressable1).press(with(any(int.class)), with(any(int.class)), with(any(int.class)));
			will(returnValue(true));
		}});
		
		IPressRouter b1 = new Block(1, 1) {
			@Override public boolean press(int x, int y, int how) {
				return pressable1.press(x, y, how);
			}
		};
		
		IPressRouter b2 = new Block(1, 1) {
			@Override public boolean press(int x, int y, int how) {
				return false;
			}
		};
		
		Frame f = new Frame();
		
		f.add(b1, 0, 0);
		f.add(b2, 0, 0);		//	b2 on top.

		assertNotNull("press", f.routePress00(0, 0));
	}
	
	@Test
	public void hiddenItemsWillIgnorePress() throws Exception {
		final IPressable pressable1 = itsContext.mock(IPressable.class);

		itsContext.checking(new Expectations() {{
			never(pressable1).press(with(any(int.class)), with(any(int.class)), with(any(int.class)));
		}});
		
		IPressRouter b = new Block(1, 1) {
			@Override public boolean press(int x, int y, int how) {
				return pressable1.press(x, y, how);
			}
		};
		
		Frame f = new Frame();
		
		f.add(b, 0, 0).hide(b);

		assertNull("press (hidden)", f.routePress00(0, 0));
		
	}
	
	@Test
	public void emptyFrameWillPuntPress() {
		Frame f = new Frame();
		
		assertNull("press (empty)", f.routePress00(0, 0));
	}
	
	@Test
	public void returnsFalseWhenAllContentsIgnorePress() throws Exception {
		IPressRouter b1 = new Block(1, 1) {
			@Override public boolean press(int x, int y, int how) {
				return false;
			}
		};
		
		IPressRouter b2 = new Block(1, 1) {
			@Override public boolean press(int x, int y, int how) {
				return false;
			}
		};

		Frame f = new Frame();
		f.add(b1, 0, 0);
		f.add(b2, 0, 0);
		
		assertNull("press (all ignore)", f.routePress00(0, 0));
	}
}
