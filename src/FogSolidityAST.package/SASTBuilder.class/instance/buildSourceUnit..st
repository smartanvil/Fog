build-node
buildSourceUnit: aDictionaryNode
	^ SASTSourceUnit new
		units: ((aDictionaryNode at: #children) collect: [ :n | self buildNode: n ]);
		yourself