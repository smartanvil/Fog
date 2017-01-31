build-node
buildBlock: aDictionaryNode
	| block |
	block := SASTBlock new.
	self buildNodes: (aDictionaryNode at: #children) into: block.
	self setNodeValuesFrom: aDictionaryNode into: block.
	^ block