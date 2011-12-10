//	$Id: LampStateTest.java,v 5af4402a8455 2011/05/21 22:29:48 nick $
//	$Source: /Users/nick/workspace/MaxMSP/DEVELOPMENT_0/mxj-development/shado/java/unit-tests/net/loadbang/shado/types/LampStateTest.java,v $

package net.loadbang.shado.types;

import static org.junit.Assert.*;
import net.loadbang.shado.util.TestingManifest;

import org.junit.Test;

public class LampStateTest {
	@Test
	public void testAgainstBlack() {
		assertEquals(0f, LampState.OFF.againstBlack(), TestingManifest.JUNIT_DELTA);
		assertEquals(1f, LampState.ON.againstBlack(), TestingManifest.JUNIT_DELTA);
		assertEquals(0f, LampState.THRU.againstBlack(), TestingManifest.JUNIT_DELTA);
		assertEquals(1f, LampState.FLIP.againstBlack(), TestingManifest.JUNIT_DELTA);
	}

	@Test
	public void testCover() {
		assertClose("tc1", LampState.ON, LampState.ON.cover(LampState.OFF));
		assertClose("tc2", LampState.ON, LampState.FLIP.cover(LampState.OFF));
		assertClose("tc3", LampState.OFF, LampState.FLIP.cover(LampState.ON));
		assertClose("tc4", LampState.ON, LampState.THRU.cover(LampState.ON));
		assertClose("tc5", LampState.THRU, LampState.THRU.cover(LampState.THRU));
	}
	
	@Test
	public void testBlend() {
		//	Pure "flipper":
		assertClose("tb1", lamp(1.0, 0.0),
					lamp(0.0, -1.0).cover(lamp(0.0, 0.0))
				   );
		
		//	Two semi-transparencies:
		assertClose("tb2", lamp(0.0, 0.25),
					lamp(0.0, 0.5).cover(lamp(0.0, 0.5))
				   );
		
		//	Semi-transparent black over white returns opaque grey:
		assertClose("tb3", lamp(0.5, 0.0),
					lamp(0.0, 0.5).cover(lamp(1.0, 0.0))
				   );

		//	Semi-transparent flipper over black returns opaque grey:
		assertClose("tb4", lamp(0.5, 0.0),
					lamp(0.0, -0.5).cover(lamp(0.0, 0.0))
				   );
		
		//	Interpolation between two whites:
		assertClose("tb5", LampState.ON,
					lamp(1.0, 0.5).cover(lamp(1.0, 0.0))
				   );
		
		//	A mostly-transparent white flipper over white:
		assertClose("tb6", lamp(0.9, 0.0),
					lamp(1.0, -0.1).cover(lamp(1.0, 0.0))
				   );

		//	A slightly-transparent white flipper over white:
		assertClose("tb7", lamp(0.1, 0.0),
					lamp(1.0, -0.9).cover(lamp(1.0, 0.0))
				   );
	}
	
	private LampState lamp(double level, double blend) {
		return new LampState((float) level, (float) blend);
	}
	
	//	This is used here and in other tests:
	public static void assertClose(String reason, LampState lamp1, LampState lamp2) {
		assertEquals(reason, lamp1.itsBlend, lamp2.itsBlend, TestingManifest.JUNIT_DELTA);
		
		//	If totally transparent (including flip), ignore level. 
		if (Math.abs((Math.abs(lamp1.itsBlend) - 1.0)) > TestingManifest.JUNIT_DELTA) {
			assertEquals(reason, lamp1.itsLevel, lamp2.itsLevel, TestingManifest.JUNIT_DELTA);
		}
	}
}
