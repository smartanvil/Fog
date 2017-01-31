build-node
buildIdentifier: aDictionaryNode
	self assertLeaf: aDictionaryNode.
	^ self setNodeValuesFrom: aDictionaryNode into: SASTIdentifier new