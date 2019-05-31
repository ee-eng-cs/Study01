module kp.provider {
	requires kp.service;

	provides kp.service.KpService with kp.provider.KpServiceProviderSimple, kp.provider.KpServiceProviderComplex;
}