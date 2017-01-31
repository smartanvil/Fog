build-node
buildElementaryTypenameExpression: aDictionaryNode
	| typeName |
	self assertLeaf: aDictionaryNode.
	typeName := self
		setNodeValuesFrom: aDictionaryNode
		into: SASTElementaryTypenameExpression new.
	self registerPostReduction: [ typeName referencesTo: (types resolve: typeName name) ].
	^ typeName