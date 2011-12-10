//	$Id$
//	$Source$

package net.loadbang.shado;

import net.loadbang.shado.exn.OperationException;

/**	Interface to renderer (chiefly for mocking in unit tests).

 	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
 */

public interface IRenderer {
	public void render(IRenderable renderable) throws OperationException;
}
