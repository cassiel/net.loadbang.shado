//	$Id$
//	$Source$

package net.loadbang.shado;

import java.util.ArrayList;

import net.loadbang.shado.exn.OperationException;
import net.loadbang.shado.exn.RangeException;
import net.loadbang.shado.types.LampState;
import net.loadbang.shadox.DisplayTaskManager;

/**	A frame is a stack of renderable objects (either
 	blocks or other frames). A frame's renderables can be moved
 	around dynamically.

	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
*/

public class Frame extends RenderableImpl {
	public class PositionedPressRouter {
		private IPressRouter itsPressRouter;
		private int itsX, itsY;
		private boolean itsVisible;
		
		private PositionedPressRouter(IPressRouter r, int x, int y) {
			itsPressRouter = r;
			itsX = x;
			itsY = y;
			itsVisible = true;
		}
		
		public IPressRouter getPressRouter() {
			return itsPressRouter;
		}
		
		private void setVisible(boolean visible) {
			itsVisible = visible;
		}
		
		public boolean getVisible() {
			return itsVisible;
		}
		
		private void setX(int x) { itsX = x; }
		private void setY(int y) { itsY = y; }
		
		private void dx(int x) { itsX += x; }
		private void dy(int y) { itsY += y; }

		public int getX() { return itsX; }
		public int getY() { return itsY; }
	}

	/**	List of renderables, in rendering order from bottom to top. */

	private ArrayList<PositionedPressRouter> itsRenderables;
	
	public Frame() {
		itsRenderables = new ArrayList<PositionedPressRouter>();
	}

	/**	Add a renderable to the top of the frame.

		@param renderable the renderable (frame or block)
		@param x the x position (0 = left)
		@param y the y position (0 = top)
	 
	 	@throws OperationException if the renderable is already in the frame
	 */

	public synchronized Frame add(IPressRouter renderable, int x, int y) throws OperationException {
		if (find00(renderable) == null) {
			itsRenderables.add(new PositionedPressRouter(renderable, x, y));
			return this;
		} else {
			throw new OperationException("item already present in frame: " + renderable, null);
		}
	}
	
	/**	Get the state of a lamp as a calculation from the component
		renderables.
	 */

	public synchronized LampState getLamp(int x, int y) {
		LampState result = LampState.THRU;
		
		for (PositionedPressRouter p: itsRenderables) {
			if (p.getVisible()) {
				result = p.getPressRouter().getLamp(x - p.getX(), y - p.getY()).cover(result);
			}
		}
		
		return result;
	}
	
	/**	Get the nth renderable from the bottom, bundled with attributes. 
	
		@throws RangeException
	 */

	public synchronized PositionedPressRouter get(int i) throws RangeException {
		try {
			return itsRenderables.get(i);
		} catch (IndexOutOfBoundsException exn) {
			throw new RangeException("Frame.get()", exn);
		}
	}
	
	protected synchronized PositionedPressRouter find00(IRenderable r) {
		for (PositionedPressRouter p: itsRenderables) {
			if (p.getPressRouter() == r) {
				return p;
			}
		}

		return null;
	}
	
	protected PositionedPressRouter find(IRenderable r) throws OperationException {
		PositionedPressRouter p00 = find00(r);
		
		if (p00 == null) {
			throw new OperationException("not found in frame: " + r, null);
		} else {
			return p00;
		}
	}

	/**	Raise a renderable to the top. */

	public synchronized Frame top(IRenderable r) throws OperationException {
		PositionedPressRouter p = find(r);
		itsRenderables.remove(p);
		itsRenderables.add(p);
		return this;
	}

	/**	Lower a renderable to the bottom. */

	public synchronized Frame bottom(IRenderable r) throws OperationException {
		PositionedPressRouter p = find(r);
		itsRenderables.remove(p);
		itsRenderables.add(0, p);
		return this;
	}

	/**	Place one renderable just above another. */
	public synchronized Frame above(IRenderable r1, IRenderable r2) throws OperationException {
		PositionedPressRouter r1entry = find(r1);
		
		if (find00(r2) == null) {
			throw new OperationException("not found in frame: " + r2, null);
		} else {
			remove(r1);
			itsRenderables.add(getPosition(r2) + 1, r1entry);
		}
		
		return this;
	}

	/**	Place one renderable just below another. */
	public synchronized Frame below(IRenderable r1, IRenderable r2) throws OperationException {
		PositionedPressRouter r1entry = find(r1);
		
		if (find00(r2) == null) {
			throw new OperationException("not found in frame: " + r2, null);
		} else {
			remove(r1);
			itsRenderables.add(getPosition(r2), r1entry);
		}
		
		return this;
	}

	private int getPosition(IRenderable r) throws OperationException {
		try {
			for (int i = 0; i < itsRenderables.size(); i++) {
				if (get(i).itsPressRouter == r) {
					return i;
				}
			}
			
			throw new OperationException("not found in frame: " + r, null);
		} catch (RangeException exn) {
			throw new OperationException("range error on " + r, exn);
		}
	}
	
	public synchronized int getX(IRenderable r) throws OperationException {
		return find(r).getX();
	}

	public synchronized int getY(IRenderable r) throws OperationException {
		return find(r).getY();
	}

	public synchronized Frame moveTo(IRenderable r, int x, int y) throws OperationException {
		PositionedPressRouter p = find(r);
		p.setX(x);
		p.setY(y);
		return this;
	}

	public synchronized Frame moveBy(IRenderable r, int dx, int dy) throws OperationException {
		PositionedPressRouter p = find(r);
		p.dx(dx);
		p.dy(dy);
		return this;
	}

	public synchronized Frame hide(IRenderable r) throws OperationException {
		find(r).setVisible(false);
		return this;
	}
	
	public synchronized Frame hideAll() {
		for (PositionedPressRouter p: itsRenderables) {
			p.setVisible(false);
		}
		
		return this;
	}

	public synchronized Frame show(IRenderable r) throws OperationException {
		find(r).setVisible(true);
		return this;
	}

	/**	Remove an item from the frame.

		@param r the item
		@throws OperationException if the item cannot be found in the frame
	 */

	public synchronized void remove(IRenderable r) throws OperationException {
		itsRenderables.remove(find(r));
	}

	/**	Deal with an incoming button press. Run through the
		content renderables, from top to bottom, mapping coordinates,
		and exiting once we get a routePress()==true.
		
		<P>Historical note for shadox scheduler users: synchronization
		here caused us a headache: because we lock the
		Frame as we traverse its contents, it used to be locked during the
		press() callback - and if this scheduled a refresh, the schedule
		attempt could deadlock against the worker thread which itself might
		lock against the frame while doing a previous refresh.
		
		<P>Solution: (i) {@link DisplayTaskManager#schedule} should never semaphore-lock;
		(ii) we should be out of the monitor before the press() callback.
	 */

	public PressRouteResult routePress00(int x, int y) {
		PositionedPressRouter[] a = copyStack();
		
		for (int i = a.length - 1; i >= 0; i--) {
			PositionedPressRouter p = a[i];
			
			if (p.itsVisible) {				//	Hidden objects cannot receive presses.
				PressRouteResult r00 =
					p.getPressRouter().routePress00(x - p.getX(), y - p.getY());
				
				if (r00 != null) { return r00; }
			}
		}

		return null;
	}

	/**	Copy the (possibly busy) stack of sub-renderables to an array,
	 	while synchronized.
	 	
	 	@return a local array of renderables
	 */

	private synchronized PositionedPressRouter[] copyStack() {
		return itsRenderables.toArray(new PositionedPressRouter[] { });
	}
}
