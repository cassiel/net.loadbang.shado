//	$Id: IVariableOutputter.java,v 4d9106ce40d8 2011/05/22 15:13:20 nick $
//	$Source: /Users/nick/workspace/MaxMSP/DEVELOPMENT_0/mxj-development/shado/java/net/loadbang/shado/IVariableOutputter.java,v $

package net.loadbang.shado;

import net.loadbang.shado.exn.OperationException;

/**	Interface for putting out data by row, with variable level.

 	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
 */

public interface IVariableOutputter {
	/** Output a row.

		@param row the row number (0 = top)
	 	@param rowData the data for the row.
	 */

	public void outputRow(int row, float[] rowData) throws OperationException;
}
