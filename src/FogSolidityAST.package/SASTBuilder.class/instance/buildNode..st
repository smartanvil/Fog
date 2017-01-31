building methods
buildNode: aDictionaryNode
	^ self
		perform: ('build' , (aDictionaryNode at: #name) , ':') asSymbol
		withArguments: {aDictionaryNode}