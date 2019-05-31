package kp.service;

/**
 * The <b>KpService</b> service.
 *
 */
public interface KpService {

	/**
	 * Returns true if the service is simple, otherwise false.
	 * 
	 * @return the flag
	 */
	default boolean isSimple() {
		return true;
	}

	/**
	 * Launches KP service.
	 * 
	 * @return the service result
	 */
	String launch();
}