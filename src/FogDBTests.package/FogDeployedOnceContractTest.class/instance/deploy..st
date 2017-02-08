initialization
deploy: aContractDescription
	^ aContractDescription mirror constructor
		applyOn: aContractDescription
		valueWithArguments: {}
		sender: self ownerAccount