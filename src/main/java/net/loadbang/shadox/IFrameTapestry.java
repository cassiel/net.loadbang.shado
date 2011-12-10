//	$Id$
//	$Source$

package net.loadbang.shadox;

import net.loadbang.shado.Frame;

/**	A Frame Tapestry is a sparse two-dimensional layout of frames,
	all cropped to the same size. We implement a "warp scrolling"
	interface so that we can get from any Frame to any other
	by scrolling at most one frame in each direction (X, Y).
	
 	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
 */

public interface IFrameTapestry {
	/** Add (or replace) a frame at (x, y). TODO: think what happens if that
		frame is the current selection.
		
		@param x the X coordinate (counting from 0)
	 	@param y the Y coordinate (counting from 0)
	 	@param frame the (new) frame
	 */

	void put(int x, int y, Frame frame);

	/**	Remove all frames on a given row

	 	@param y the Y coordinate (counting from 0)
	 */

	void clearRow(int y);
}
