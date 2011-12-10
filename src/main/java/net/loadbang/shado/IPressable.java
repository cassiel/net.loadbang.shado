//	$Id$
//	$Source$

package net.loadbang.shado;

/**	IPressable is a mixin interface denoting objects which
	actually process the press events, probably via Python.

	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
 */

public interface IPressable {
	
	/**	Finally signal a button press, probably into
		Python.
	
		@param x the column, in the correct coordinates
			for the object
		@param y the row
		@param how 1 for on, 0 for off

	 	@return true if we want to indicate that we've
	 		dealt with the press here; false otherwise.
	 		NB: if this call returns false for a press-on
	 		(how==1), the event will be ignored - the
	 		press will possibly be passed to other objects -
	 		so the release event will not arrive here.
	 */

	public boolean press(int x, int y, int how);
}
