package kp.provider;

import kp.service.KpService;

/**
 * The provider of a simple <b>KpService</b> service implementation.
 *
 */
public class KpServiceProviderSimple {

	/**
	 * Obtains an instance of the service.
	 * 
	 * @return the service instance
	 */
	public static KpService provider() {
		return () -> "Message from «simple»  KP service";
	}
}