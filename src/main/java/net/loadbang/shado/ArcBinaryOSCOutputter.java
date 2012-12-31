//	$Id: ArcBinaryOSCOutputter.java,v 4d9106ce40d8 2011/05/22 15:13:20 nick $
//	$Source: /Users/nick/workspace/MaxMSP/DEVELOPMENT_0/mxj-development/shado/java/net/loadbang/shado/ArcBinaryOSCOutputter.java,v $

package net.loadbang.shado;

import java.net.InetAddress;
import java.net.UnknownHostException;

import net.loadbang.shado.exn.OperationException;
import net.loadbang.osc.comms.Transmitter;
import net.loadbang.osc.comms.UDPTransmitter;
import net.loadbang.osc.data.Message;
import net.loadbang.osc.exn.CommsException;
import net.loadbang.osc.exn.SetupException;

/**	Outputter using our OSC library.

	Temporary outputter for the arc - it only does binary monochrome. We've
	not touched the bitwise representation: obviously, we'll have to for
	variable-level. Since this is temporary, we won't worry too much about
	refactoring for now.

	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
*/

public class ArcBinaryOSCOutputter implements IBinaryOutputter {
	private Transmitter itsTransmitter;
	private String itsPrefix;
	private static final int NUM_ARC_LEDS = 64;

	public ArcBinaryOSCOutputter(Transmitter transmitter, String prefix)
			throws UnknownHostException, CommsException
		{
			itsTransmitter = transmitter;
			itsPrefix = prefix;
		}

	public ArcBinaryOSCOutputter(String host, int port, String prefix)
		throws UnknownHostException, CommsException
	{
		this(new UDPTransmitter(InetAddress.getByName(host), port), prefix);
	}

	public void outputRow(int encoder, long encoderBits)
		throws OperationException
	{
		Message m = new Message(itsPrefix + "/ring/map").addInteger(encoder);

		for (int i = 0; i < NUM_ARC_LEDS; i++) {
			m.addInteger((((encoderBits >> i) & 1) == 1) ? 15 : 0);
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
