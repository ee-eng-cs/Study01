package kp.provider;

import kp.service.KpService;

/**
 * The provider of a complex <b>KpService</b> service implementation.
 *
 */
public class KpServiceProviderComplex {
	/**
	 * Obtains an instance of the service.
	 *
	 * @return the service instance
	 */
	public static KpService provider() {

		final KpService kpService = new KpService() {
			/**
			 * {@inheritDoc}
			 */
			public boolean isSimple() {
				return false;
			}

			/**
			 * {@inheritDoc}
			 */
			@Override
			public String launch() {
				return "Message from «complex» KP service";
			}
		};
		return kpService;
	}
}