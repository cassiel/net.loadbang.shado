//	$Id$
//	$Source$

package net.loadbang.shado;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import net.loadbang.shado.exn.RangeException;
import net.loadbang.shado.types.LampState;

import org.jmock.Expectations;
import org.jmock.Mockery;
import org.jmock.integration.junit4.JMock;
import org.jmock.integration.junit4.JUnit4Mockery;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(JMock.class)
public class BlockTest {
	private Mockery itsContext = new JUnit4Mockery();

	@Test
	public void simpleLampSet() throws Exception {
		Block b = new Block(1, 1);
		b.setLamp(0, 0, LampState.ON);
		assertEquals("lamp state", LampState.ON, b.getLamp(0, 0));
	}
	
	@Test
	public void canFill() {
		Block b = new Block(2, 2);
		b.fill(LampState.ON);
		assertEquals("lamp state", LampState.ON, b.getLamp(1, 1));
	}
	
	@Test
	public void createFromRows() throws Exception {
		Block b = new Block("1010 .... ././");
		
		assertEquals("lamp 1", LampState.ON, b.getLamp(2, 0));
		assertEquals("lamp 2", LampState.THRU, b.getLamp(0, 1));
		assertEquals("lamp 3", LampState.FLIP, b.getLamp(3, 2));
	}
	
	@Test(expected=RangeException.class)
	public void rangeErrorRaisedOnSet() throws Exception {
		Block b = new Block(1, 1);
		b.setLamp(9, 17, LampState.ON);
		
	}

	@Test
	public void noRangeErrorRaisedOnGet() throws Exception {
		Block b = new Block(1, 1);
		b.getLamp(-1, 40);
	}
	
	@Test
	public void canMakeThinBlocks() throws Exception {
		new Block(1, 10);
		new Block(10, 1);
	}
	
	@Test
	public void canRouteSimpleOriginPress() {
		//	A bit of a frig: a bare IPressable for mocking.
		final IPressable pressable = itsContext.mock(IPressable.class);

		itsContext.checking(new Expectations() {{
			one(pressable).press(0, 0, 1); will(returnValue(true));
		}});
		
		Block b =
			new Block(1, 1) {
				@Override public boolean press(int x, int y, int how) {
					return pressable.press(x, y, how);
				}
			};
		
		assertNotNull("simple origin test", b.routePress00(0, 0));
	}
	
	@Test
	public void willNotRoutePressesOutsideRange() {
		final IPressable pressable = itsContext.mock(IPressable.class);

		itsContext.checking(new Expectations() {{
			//	No expectations: we should get no presses.
		}});
		
		Block b =
			new Block(1, 1) {
				@Override public boolean press(int x, int y, int how) {
					return pressable.press(x, y, how);
				}
			};
		
		assertNull("out-of-range press 1", b.routePress00(1, -1));
		assertNull("out-of-range press 2", b.routePress00(-1, 1));
	}
}
