//	$Id: ArcVariableOSCOutputter.java,v 4d9106ce40d8 2011/05/22 15:13:20 nick $
//	$Source: /Users/nick/workspace/MaxMSP/DEVELOPMENT_0/mxj-development/shado/java/net/loadbang/shado/ArcVariableOSCOutputter.java,v $

package net.loadbang.shado;

import java.net.InetAddress;
import java.net.UnknownHostException;

import net.loadbang.shado.exn.OperationException;
import net.loadbang.osc.comms.Transmitter;
import net.loadbang.osc.comms.UDPTransmitter;
import net.loadbang.osc.data.Message;
import net.loadbang.osc.exn.CommsException;
import net.loadbang.osc.exn.SetupException;

/**	Variable-level outputter for the arc.

	@author Nick Rothwell, nick@cassiel.com / nick@loadbang.net
*/

public class ArcVariableOSCOutputter implements IVariableOutputter {
	private Transmitter itsTransmitter;
	private String itsPrefix;
	private static final int NUM_ARC_LEDS = 64;

	public ArcVariableOSCOutputter(String host, int port, String prefix)
		throws UnknownHostException, CommsException
	{
		itsTransmitter =
			new UDPTransmitter(InetAddress.getByName(host), port);
		
		itsPrefix = prefix;
	}

	public void outputRow(int encoder, float[] values)
		throws OperationException
	{
		Message m = new Message(itsPrefix + "/ring/map").addInteger(encoder);

		for (int i = 0; i < NUM_ARC_LEDS; i++) {
			int v = Math.min(15, Math.max(0, (int) (0.5 + values[i] * 15.0)));
			m.addInteger(v);
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
