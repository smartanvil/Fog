tests
testContractCallSetMethodInTransactionModifiesValue
	| method transactionReceipt hash futureTransactionReceipt mirror |
	mirror := simpleStorage contract mirror instanceMirror.
	method := mirror methods detect: [ :m | m selector asSymbol = #set: ].
	hash := method
		applyOn: simpleStorage
		valueWithArguments: {2}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	futureTransactionReceipt := FogTransactionMonitorService current receiptFor: hash.
	transactionReceipt := futureTransactionReceipt synchronizeTimeout: 10 minutes.
	self assert: (transactionReceipt at: #transactionHash) = hash.
	self assert: (mirror property: #storedData at: simpleStorage) equals: 2.
	method := mirror methods detect: [ :m | m selector asSymbol = #get ].
	self
		assert:
			(method
				applyOn: simpleStorage
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60)
		equals: 2