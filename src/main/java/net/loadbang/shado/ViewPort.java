//	$Id$
//	$Source$

package net.loadbang.shado;

import net.loadbang.shado.types.LampState;

/**	A ViewPort is a renderable which crops another renderable, exposing
	a window over it. Anything outside the ViewPort is folded to
	{@link LampState#THRU THRU} (so the outside of the port acts as transparency).
	
	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
  */

public class ViewPort extends RenderableImpl implements IPressable {
	private IPressRouter itsPressRouter;
	private int itsX, itsY, itsWidth, itsHeight;

	/**	Build a view port around a renderable object. All lamp values
	 	outside the port's coordinates will be {@link LampState#THRU}.
	 	
	 	@param router the press router (renderable) within the view port
	 	@param x the left edge coordinate of the view port
		@param y the top edge coordinate of the view port
		@param width the view port's width
		@param height the view port's height
	 */

	public ViewPort(IPressRouter router, int x, int y, int width, int height) {
		itsPressRouter = router;
		itsX = x;
		itsY = y;
		itsWidth = width;
		itsHeight = height;
	}

	public int getX() {
		return itsX;
	}

	public void setX(int x) {
		this.itsX = x;
	}

	public int getY() {
		return itsY;
	}

	public void setY(int y) {
		this.itsY = y;
	}

	public int getWidth() {
		return itsWidth;
	}

	public void setWidth(int width) {
		this.itsWidth = width;
	}

	public int getHeight() {
		return itsHeight;
	}

	public void setHeight(int height) {
		this.itsHeight = height;
	}

	/** Get the state of a lamp; will be {@link LampState#THRU}
	 	for coordinates outside the view port.
	 */

	public LampState getLamp(int x, int y) {
		if (   x >= itsX && x < itsX + itsWidth
			&& y >= itsY && y < itsY + itsHeight
		   ) {
			return itsPressRouter.getLamp(x, y);
		} else {
			return LampState.THRU;
		}
	}

	/**	Deal with a button press in local coordinates; override this
		to do something interesting.
	 */

	public boolean press(int x, int y, int how) { return false; }

	/**	Deal with an incoming button press. Return false if out
	 	of range, otherwise defer to press() with coordinates mapped
	 	to make (0, 0) the top left of the actual window. If
	 	press() returns false, regard it as a punt at this level,
	 	and attempt to route into the window's encapsulated
	 	object (with the original coordinates).
     */

	public PressRouteResult routePress00(int x, int y) {
		if (   x >= itsX && x < itsX + itsWidth
			&& y >= itsY && y < itsY + itsHeight
		   ) {
			int localX = x - itsX;
			int localY = y - itsY;

			boolean done = press(localX, localY, 1);
			
			if (done) {
				return new PressRouteResult(this, localX, localY);
			} else {
				return itsPressRouter.routePress00(x, y);
			}
		} else {
			return null;
		}
	}
}
