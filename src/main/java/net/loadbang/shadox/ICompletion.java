//	$Id$
//	$Source$

package net.loadbang.shadox;

/**	Simple interface for signalling conpletion.

	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
 */

public interface ICompletion {
	/**	Signal completion

	 	@param how true for successful completion, false for cancellation
	 */

	void completed(boolean how);
}
