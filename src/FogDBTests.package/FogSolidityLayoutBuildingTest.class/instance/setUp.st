initialization
setUp
	super setUp.
	self timeLimit: 3 minutes.
	contract
		ifNil: [ contract := (FogContractDescription instances detect: [ :a | a fromFile basename = 'struct_contract.sol' ]) deployFor: self ownerAccount.
			contract waitIsReady ].
	mirror := contract contract mirror