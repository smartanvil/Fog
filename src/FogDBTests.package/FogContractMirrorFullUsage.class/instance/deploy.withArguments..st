as yet unclassified
deploy: aContractDescription withArguments: aCollection
	^ aContractDescription mirror constructor
		applyOn: aContractDescription
		valueWithArguments: aCollection
		sender: self ownerAccount