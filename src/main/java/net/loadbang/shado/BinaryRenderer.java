//	$Id: BinaryRenderer.java,v 4d9106ce40d8 2011/05/22 15:13:20 nick $
//	$Source: /Users/nick/workspace/MaxMSP/DEVELOPMENT_0/mxj-development/shado/java/net/loadbang/shado/BinaryRenderer.java,v $

package net.loadbang.shado;

import net.loadbang.shado.exn.OperationException;

/**	A renderer with bit values for the state of the lamps. It knows the notional
	size of the target device, and also maintains a change buffer.

 	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
 */


public class BinaryRenderer implements IRenderer {
	private int itsWidth;
	private int itsHeight;
	private IBinaryOutputter itsOutputter;
	private long[] itsLastRows;
	private boolean[] itsAssigned;

	public BinaryRenderer(int width, int height, IBinaryOutputter outputter) {
		itsWidth = width;
		itsHeight = height;
		itsLastRows = new long[itsHeight];
		itsAssigned = new boolean[itsHeight];
		itsOutputter = outputter;
		
		for (int i = 0; i < itsHeight; i++) {
			itsAssigned[i] = false;
		}
	}

	/**	Render. Synchronized so that we don't foul up our history buffer if
	 	called multiple times (unlikely as that is). Note also that the call
	 	to {@link IRenderable#getRenderedLamp} might also enter the monitor
	 	for the renderable (which, if a frame, precludes all editing operations).
	 */

	public synchronized void render(IRenderable renderable) throws OperationException {
		for (int row = 0; row < itsHeight; row++) {
			long bits = 0L;
			
			for (int col = 0; col < itsWidth; col++) {
				if (renderable.getRenderedLamp(col, row) > 0.5) {
					bits |= (1L << col);
				}
			}
			
			if (!itsAssigned[row] || bits != itsLastRows[row]) {
				itsOutputter.outputRow(row, bits);
				itsLastRows[row] = bits;
				itsAssigned[row] = true;
			}
		}
	}
}
