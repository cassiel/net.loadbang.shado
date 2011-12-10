//	$Id: VariableRenderer.java,v 4d9106ce40d8 2011/05/22 15:13:20 nick $
//	$Source: /Users/nick/workspace/MaxMSP/DEVELOPMENT_0/mxj-development/shado/java/net/loadbang/shado/VariableRenderer.java,v $

package net.loadbang.shado;

import net.loadbang.shado.exn.OperationException;

/**	A renderer which supports variable depth. For now, there's
	no suppression of duplicates when updating (since we're
	dealing with floats).

 	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
 */


public class VariableRenderer implements IRenderer {
	private int itsWidth;
	private int itsHeight;
	private IVariableOutputter itsOutputter;

	public VariableRenderer(int width, int height, IVariableOutputter outputter) {
		itsWidth = width;
		itsHeight = height;
		itsOutputter = outputter;
	}

	/**	Render. Pretty simple: just put out all rows. */

	public void render(IRenderable renderable) throws OperationException {
		float rowData[];

		for (int row = 0; row < itsHeight; row++) {
			rowData = new float[itsWidth];
			
			for (int col = 0; col < itsWidth; col++) {
				rowData[col] = renderable.getRenderedLamp(col, row);
			}
			
			itsOutputter.outputRow(row, rowData);
		}
	}
}
