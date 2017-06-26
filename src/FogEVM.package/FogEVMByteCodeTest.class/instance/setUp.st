initialization
setUp
	super setUp.
	contractDescription := FogCache current detectFileContractDescriptionsOrNil: [ :a | a fromFile basename = 'public_3states_poll.sol' ]