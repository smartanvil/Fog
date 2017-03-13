initialization
setUp
	super setUp.
	self timeLimit: 3 minutes.
	self class contract
		ifNil: [ contract := self createContract.
			contract waitIsReady.
			self class contract: contract ].
	contract := self class contract.
	mirror := contract mirror