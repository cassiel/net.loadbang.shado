//	$Id: BonjourTest.java,v 65bd753d6f27 2011/04/06 08:54:15 nick $
//	$Source: /Users/nick/workspace/MaxMSP/DEVELOPMENT_0/mxj-development/shado/java/net/loadbang/shado/console/BonjourTest.java,v $

package net.loadbang.shado.console;

import java.net.InetAddress;
import java.net.UnknownHostException;

import com.apple.dnssd.BrowseListener;
import com.apple.dnssd.DNSSD;
import com.apple.dnssd.DNSSDException;
import com.apple.dnssd.DNSSDService;
import com.apple.dnssd.ResolveListener;
import com.apple.dnssd.TXTRecord;

public class BonjourTest {
	static public class Discover implements BrowseListener {
		// the constructor.
		public Discover() { }

		public void serviceFound(DNSSDService browser, int flags, int ifIndex,
								 String serviceName, String regType, String domain)
		{
			System.out.println("serviceFound index=" + ifIndex + " name=" + serviceName
							   + " regType=" + regType
							   + " domain=" + domain
							  );

			try {
				DNSSD.resolve(0, ifIndex, serviceName, regType, domain,
						new ResolveListener() {
							public void serviceResolved(DNSSDService resolver, int flags, int ifIndex,
														String fullname, String hostname,
														int port, TXTRecord txtRecord
													   )
							{
								InetAddress theAddress;
								try {
									theAddress = InetAddress.getByName(hostname);
									System.out.println("resolve: " + hostname + " @ " + theAddress + ":" + port
											+ " fullname=" + fullname + " txt=" + txtRecord);
								} catch (UnknownHostException e) {
									// ouch..
								}
								
								resolver.stop();
							}

							public void operationFailed(DNSSDService arg0, int arg1) {
								// ouch, again!
							}
						});
			} catch (DNSSDException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		public void serviceLost(DNSSDService browser, int flags, int ifIndex,
								String serviceName, String regType, String domain)
		{
			System.out.println("serviceLost index=" + ifIndex + " name=" + serviceName
					   + " regType=" + regType
					   + " domain=" + domain
					  );
		}

		public void operationFailed(DNSSDService arg0, int arg1) {
			// this one is required by BaseListener, which is the parent of all other Listener Interfaces.
			System.out.println("operationFailed");
		}
	}

	public static void main(String[] args) {
		try {
			Object browser = DNSSD.browse("_monome-osc._udp", new Discover());
		} catch (DNSSDException e) {
			e.printStackTrace();
		}
	}
}
