build-node
buildLiteral: aDictionaryNode
	self assertLeaf: aDictionaryNode.
	^ self setNodeValuesFrom: aDictionaryNode into: SASTLiteral new