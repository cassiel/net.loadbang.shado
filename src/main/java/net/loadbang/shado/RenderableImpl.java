//	$Id: RenderableImpl.java,v e10460961dd6 2011/05/22 11:43:48 nick $
//	$Source: /Users/nick/workspace/MaxMSP/DEVELOPMENT_0/mxj-development/shado/java/net/loadbang/shado/RenderableImpl.java,v $

package net.loadbang.shado;

/**	Top-level abstract class for renderables.

	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
 */

public abstract class RenderableImpl implements IPressRouter {
	/**	Actually generate the final state of a lamp - off or on.
	 	This is the "low-resolution" rendering, so we just
	 	threshold the floating value against 0.5.
	 */

	public float getRenderedLamp(int x, int y) {
		return getLamp(x, y).againstBlack();
	}
}
