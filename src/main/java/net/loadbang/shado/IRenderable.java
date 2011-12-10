//	$Id: IRenderable.java,v e10460961dd6 2011/05/22 11:43:48 nick $
//	$Source: /Users/nick/workspace/MaxMSP/DEVELOPMENT_0/mxj-development/shado/java/net/loadbang/shado/IRenderable.java,v $

package net.loadbang.shado;

import net.loadbang.shado.types.LampState;

/**	An IRenderable is an interface for components of a frame (blocks,
	view ports or nested frames).
	
	<P>Modified: shado now uses a variable-level (and variable-alpha)
	model for calculations, so a "rendered" lamp is a float between
	0.0 and 1.0.

	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
 */

public interface IRenderable {
	/**	Get the state of a lamp, either directly from a block or
	 	via a pile of calculations from a view port or frame.
	 */

	public LampState getLamp(int x, int y);

	/**	Get the rendered state of a lamp. Frames do complex
		rendering, whereas it's pretty easy for a block.
	 */

	public float getRenderedLamp(int x, int y);
}
