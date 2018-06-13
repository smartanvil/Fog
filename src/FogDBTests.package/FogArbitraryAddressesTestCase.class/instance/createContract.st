as yet unclassified
createContract
	| description |
	description := self createContractDescription.
	^ (description mirror constructor
		using: session
		applyOn: description
		valueWithArguments: {}
		from: self ownerAccount
		gas: 3000000
		gasPrice: 60)
		waitIsReady;
		yourself