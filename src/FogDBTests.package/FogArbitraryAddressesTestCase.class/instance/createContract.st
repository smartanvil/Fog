as yet unclassified
createContract
	| description |
	description := self createContractDescription.
	^ (description mirror constructor
		applyOn: description
		valueWithArguments: {}
		sender: self ownerAccount)
		waitIsReady;
		yourself