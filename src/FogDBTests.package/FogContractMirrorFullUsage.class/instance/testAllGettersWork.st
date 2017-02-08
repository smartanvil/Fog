tests
testAllGettersWork
	mirror methods
		select: [ :m | m name beginsWith: 'get' ]
		thenDo: [ :m | (m applyOn: contract valueWithArguments: {} sender: self ownerAccount)  ]