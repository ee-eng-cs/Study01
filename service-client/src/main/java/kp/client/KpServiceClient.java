package kp.client;

import java.util.ServiceLoader;
import java.util.ServiceLoader.Provider;
import java.util.stream.Stream;

import kp.service.KpService;

/**
 * The <b>KpService</b> service consumer.
 *
 */
public class KpServiceClient {

	/**
	 * The main method.
	 * 
	 * @param args the arguments
	 */
	public static void main(String[] args) {

		System.out.println("- ".repeat(50));
		Stream.of(KpService.class, KpServiceClient.class)/*-*/
				.map(Class::getModule).map(Module::getDescriptor).forEach(System.out::println);
		System.out.println("- ".repeat(50));

		System.out.println("All provided services:");
		ServiceLoader.load(KpService.class).stream().map(Provider::get)/*-*/
				.forEach(arg -> System.out.printf("Service result[%s]%n", arg.launch()));
		System.out.println("- ".repeat(50));

		System.out.println("Only simple service:");
		ServiceLoader.load(KpService.class).stream().map(Provider::get).filter(KpService::isSimple)/*-*/
				.forEach(arg -> System.out.printf("Service result[%s]%n", arg.launch()));
		System.out.println("- ".repeat(50));
	}
}