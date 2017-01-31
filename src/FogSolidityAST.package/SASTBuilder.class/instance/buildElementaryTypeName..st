build-node
buildElementaryTypeName: aDictionaryNode
	| typeName |
	self assertLeaf: aDictionaryNode.
	typeName := self setNodeValuesFrom: aDictionaryNode into: SASTElementaryTypeName new.
	self registerPostReduction: [ typeName referencesTo: (types resolve: typeName name) ].
	^ typeName