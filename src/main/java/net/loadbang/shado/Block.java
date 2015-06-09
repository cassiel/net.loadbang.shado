//	$Id$
//	$Source$

package net.loadbang.shado;

import net.loadbang.osc.exn.DataException;
import net.loadbang.shado.exn.OperationException;
import net.loadbang.shado.exn.RangeException;
import net.loadbang.shado.types.LampState;

/**	A block is a rectangular matrix of lamps/buttons with a callback function for
	button presses.

	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
 */

public class Block extends RenderableImpl implements IPressable {
	private int itsWidth, itsHeight;
	private LampState[][] itsLamps;
	
	private void init(int width, int height) {
		itsWidth = width;
		itsHeight = height;
		
		itsLamps = new LampState[width][height];
	}
	
	/**	Create a block with the specified width and height, and
	 	a default lamp state of {@link LampState#THRU} for all pixels.
	 */

	public Block(int width, int height) {
		init(width, height);
		fill(LampState.THRU);
	}
	
	/**	Create a block from a string of tokens denoting the rows. 
	
		@throws DataException if the tokens are not all the same length,
		or if any of them contains an illegal symbol. */
	
	public Block(String tokens) throws DataException {
		String[] rows = tokens.split("\\s+");
		int len = -1;
		
		try {
			for (int y = 0; y < rows.length; y++) {
				String row = rows[y];
				int len1 = row.length();
				
				if (len < 0) {
					len = len1;
					init(len, rows.length);
				} else if (len != len1) {
					throw new DataException("Block: token lengths do not match", null);
				}
				
				for (int x = 0; x < len; x++) {
					setLamp(x, y, decode(row.charAt(x)));
				}
			}
		} catch (RangeException _) {
			assert false: "array range in Block(tokens)";
		}
	}
	
	private static LampState decode(char ch) throws DataException {
		switch (ch) {
			case '0': return LampState.OFF;
			case '1': return LampState.ON;
			case '.': return LampState.THRU;
			case '/': return LampState.FLIP;
			default: throw new DataException("Block: bad character for lamp state: '" + ch + "'", null);
		}
	}

	/** Set a lamp.

		@param x the x coordinate
		@param y the y coordinate
		@param state the lamp state to set
		@return this Block
		@throws RangeException if the coordinates are out of range
	 */

	public synchronized Block setLamp(int x, int y, LampState state) throws RangeException {
		try {
			itsLamps[x][y] = state;
			return this;
		} catch (ArrayIndexOutOfBoundsException exn) {
			throw new RangeException("setLamp", exn);
		}
	}
	
	/**	"Fill" a block with a lamp state. */
	
	public synchronized Block fill(LampState state) {
		for (int x = 0; x < itsWidth; x++) {
			for (int y = 0; y < itsHeight; y++) {
				itsLamps[x][y] = state;
			}
		}
		
		return this;
	}

	/**	Get a lamp state. For the purposes of rendering, a block is infinite in
		all directions, returning THRU except for its active area.
	 */
	
	public synchronized LampState getLamp(int x, int y) {
		if (x < 0 || y < 0 || x >= itsWidth || y >= itsHeight) {
			return LampState.THRU;
		} else {
			return itsLamps[x][y];
		}
	}

	/**	Button callback. We probably want to support chording, but for now
		we'll just do single button on/off. The default implementation does
		nothing and returns false.
	
		<P>Note that the default implementation is not synchronized: on the
		remote offchance that you have an application which can route
		press() into a structure from multiple threads, you're on your own.
	 */

	public boolean press(int x, int y, int how) { return false; }

	/**	Deal with an incoming button press. Defer to the press()
		method if the coordinates are within range, otherwise
		punt and return false.
	 */
	
	public PressRouteResult routePress00(int x, int y) {
		if (   x >= 0 && x < itsWidth
			&& y >= 0 && y < itsHeight
		   ) {
			boolean done = press(x, y, 1);
			
			if (done) { 
				return new PressRouteResult(this, x, y);
			} else {
				return null;
			}
		} else {
			return null;
		}
	}
}
