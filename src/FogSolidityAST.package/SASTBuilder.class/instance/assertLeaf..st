converting
assertLeaf: aDictionaryNode
	self assert: (aDictionaryNode includesKey: #children) not.
	