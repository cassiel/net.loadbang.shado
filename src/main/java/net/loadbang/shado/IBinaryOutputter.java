//	$Id: IBinaryOutputter.java,v 4d9106ce40d8 2011/05/22 15:13:20 nick $
//	$Source: /Users/nick/workspace/MaxMSP/DEVELOPMENT_0/mxj-development/shado/java/net/loadbang/shado/IBinaryOutputter.java,v $

package net.loadbang.shado;

import net.loadbang.shado.exn.OperationException;

/**	Interface for putting out data by row. At this intermediate stage
	we're encoding as longs (64 bits should be enough for anyone (!)).

 	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
 */

public interface IBinaryOutputter {
	/** Output a row.

		@param row the row number (0 = top)
	 	@param rowBits the bit pattern for the row: bit 0 is leftmost.
	 */

	public void outputRow(int row, long rowBits) throws OperationException;
}
