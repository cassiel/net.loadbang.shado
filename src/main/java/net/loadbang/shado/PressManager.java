//	$Id$
//	$Source$

package net.loadbang.shado;

import net.loadbang.shado.IPressRouter.PressRouteResult;
import net.loadbang.pico.util.TwoDHashMap;

/**	Manage press and release events. Objects in the renderable heirarchy
	might move around between press and release, so that matching calls to
	press() on an object might have mismatched coordinates - or the calls
	may not occur in matching pairs at all. Hence, we retain the object
	and coordinates for every successful press-on, indexed against actual
	monome coordinates, so that we can always deliver the corresponding
	release.

	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
 */


public class PressManager {
	private IPressRouter itsTopRouter;

	private TwoDHashMap<Integer, Integer, PressRouteResult> itsMap =
		new TwoDHashMap<Integer, Integer, PressRouteResult>();

	public PressManager(IPressRouter topRouter) {
		itsTopRouter = topRouter;
	}

	/**	Deal with a button press. If how!=0, send in the button press; if we get
		back a non-null, then remember the item so that we can clear it later.
		
	 	@param x the monome column
	 	@param y the monome row
	 	@param how non-zero for on, zero for off
	 */

	public void press(int x, int y, int how) {
		release(x, y);
		
		if (how != 0) {
			PressRouteResult press00 = itsTopRouter.routePress00(x, y);
			
			if (press00 != null) {
				itsMap.put(x, y, press00);
			}
		}
	}
	
	private void release(int x, int y) {
		PressRouteResult r00 = itsMap.get00(x, y);
		
		if (r00 != null) {
			r00.release();
			itsMap.remove(x, y);
		}
	}
}
