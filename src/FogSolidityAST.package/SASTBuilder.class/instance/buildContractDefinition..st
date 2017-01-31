build-node
buildContractDefinition: aDictionaryNode
	| contract |
	contract := SASTContract new.
	self buildNodes: (aDictionaryNode at: #children) into: contract.
	self setNodeValuesFrom: aDictionaryNode into: contract.
	^ contract