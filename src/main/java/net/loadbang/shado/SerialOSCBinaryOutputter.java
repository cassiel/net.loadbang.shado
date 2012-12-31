//	$Id: SerialOSCBinaryOutputter.java,v 4d9106ce40d8 2011/05/22 15:13:20 nick $
//	$Source: /Users/nick/workspace/MaxMSP/DEVELOPMENT_0/mxj-development/shado/java/net/loadbang/shado/SerialOSCBinaryOutputter.java,v $

package net.loadbang.shado;

import java.net.InetAddress;
import java.net.UnknownHostException;

import net.loadbang.shado.exn.OperationException;
import net.loadbang.osc.comms.Transmitter;
import net.loadbang.osc.comms.UDPTransmitter;
import net.loadbang.osc.data.Message;
import net.loadbang.osc.exn.CommsException;
import net.loadbang.osc.exn.SetupException;

/**	Outputter for binary (zero/one) grid displays, using
	the new SerialOSC protocol.

	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
*/

public class SerialOSCBinaryOutputter implements IBinaryOutputter {
	private int itsNumBytes;
	private Transmitter itsTransmitter;
	private String itsPrefix;

	public SerialOSCBinaryOutputter(Transmitter transmitter, int width, String prefix)
		throws UnknownHostException, CommsException
	{
		itsTransmitter = transmitter;
		itsPrefix = prefix;
		itsNumBytes = 1 + (width - 1) / 8;
			//	I know: deals with non-multiples of 8. Not sure why that's useful...
	}

	public SerialOSCBinaryOutputter(String host, int port, int width, String prefix)
			throws UnknownHostException, CommsException
	{
		this(new UDPTransmitter(InetAddress.getByName(host), port), width, prefix);
	}

	/** Output a row. rowBits can be up to 64 bits. 

	 	@see net.loadbang.shado.IBinaryOutputter#outputRow(int, long)
	 */

	public void outputRow(int row, long rowBits)
		throws OperationException
	{
		Message m = new Message(itsPrefix + "/grid/led/row")
			.addInteger(0)				//	X offset within row (unused).
			.addInteger(row);

		for (int i = 0; i < itsNumBytes; i++) {
			m.addInteger((int) (rowBits >> (i * 8)) & 0xFF);
		}
		
		try {
			itsTransmitter.transmit(m);
		} catch (SetupException e) {
			throw new OperationException("setup", e);
		} catch (CommsException e) {
			throw new OperationException("comms", e);
		}
	}
}
