tests
testAllGettersWork
	mirror methods
		select: [ :m | m name beginsWith: 'get' ]
		thenDo: [ :m | 
			m
				applyOn: contract
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60 ]