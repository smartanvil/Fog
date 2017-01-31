build-node
buildEnumValue: aDictionaryNode
	self assertLeaf: aDictionaryNode.
	^ self setNodeValuesFrom: aDictionaryNode into: SASTEnumValue new