build-node
buildPragmaDirective: aDictionaryNode
	self assertLeaf: aDictionaryNode.
	^ self setNodeValuesFrom: aDictionaryNode into: SASTPragma new