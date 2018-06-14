tests
testContractCallSetMethodInTransactionModifiesValue
	| method transactionReceipt hash futureTransactionReceipt mirror |
	self assert: session isNotNil.
	mirror := simpleStorage contract mirror instanceMirror.
	method := mirror methods detect: [ :m | m selector asSymbol = #set: ].
	hash := method
		using: session
		applyOn: simpleStorage
		valueWithArguments: {2}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	futureTransactionReceipt := session receiptFor: hash.
	transactionReceipt := futureTransactionReceipt synchronizeTimeout: 10 minutes.
	self assert: (transactionReceipt at: #transactionHash) = hash.
	self
		assert:
			(mirror
				using: session
				property: #storedData
				on: simpleStorage
				at: #latest)
		equals: 2.
	method := mirror methods detect: [ :m | m selector asSymbol = #get ].
	self
		assert:
			(method
				using: session
				applyOn: simpleStorage
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60)
		equals: 2