as yet unclassified
createAndDeployInstance
	^ contract mirror constructor
		applyOn: contract
		valueWithArguments: arguments
		sender: owner