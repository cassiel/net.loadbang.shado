//	$Id$
//	$Source$

package net.loadbang.shado;


/**	An IPressRouter is an interface for renderables which can
	route button clicks. (All our renderables are actually
	press routers.) An IPressRouter takes in a routePress00(),
	and dispatches this into press() calls, doing clipping and
	coordinate conversion as required.

	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
 */

public interface IPressRouter extends IRenderable {
	
	/** A logged button-down, with its {@link IPressable} and
	  	the coordinates (to be used for release).
	 */

	public class PressRouteResult {
		private IPressable itsPressable;
		private int itsX, itsY;
		
		public PressRouteResult(IPressable pressable, int x, int y) {
			itsPressable = pressable;
			itsX = x;
			itsY = y;
		}

		/**	Release the button press. */
		public void release() {
			itsPressable.press(itsX, itsY, 0);
		}
	}
	
	/**	Accept a button press. The call returns
		a bundle containing the IPressable which handled the event,
		and the X and Y which it saw; null is returned if the
		event was not handled.
	
		@param x the column
		@param y the row
		@return information about the object, and the local
		 	coordinates, if it
			dealt with the press; null otherwise
	 */

	PressRouteResult routePress00(int x, int y);
}
