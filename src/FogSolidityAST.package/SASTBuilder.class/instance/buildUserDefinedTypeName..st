build-node
buildUserDefinedTypeName: aDictionaryNode
	| typeName |
	self assertLeaf: aDictionaryNode.
	typeName := self setNodeValuesFrom: aDictionaryNode into: SASTUserDefinedTypeName new.
	self registerPostReduction: [ typeName referencesTo: (types resolve: typeName name) ].
	^ typeName