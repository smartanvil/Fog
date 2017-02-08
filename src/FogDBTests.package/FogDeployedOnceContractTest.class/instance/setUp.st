initialization
setUp
	| description |
	super setUp.
	self timeLimit: 3 minutes.
	self class contract
		ifNil: [ description := FogContractDescription instances
				detect: [ :a | a fromFile basename = self contractSourceCodeName ].
			contract := self deploy: description.
			contract waitIsReady.
			self class contract: contract ].
	contract := self class contract.
	mirror := contract mirror