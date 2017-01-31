build-node
buildArrayTypeName: aDictionaryNode
	| typeName type |
	typeName := self buildNodes: (aDictionaryNode at: #children) into: SASTArrayTypeName new.
	self setNodeValuesFrom: aDictionaryNode into: typeName.
	self
		registerPostReduction: [ type := SASTArrayType new innerType: (types resolve: typeName innerTypeName name).
			type pushReturnType: (types resolve: 'uint256').
			types install: type.
			typeName referencesTo: type.
			type relatedFunctions do: [ :f | types install: f ] ].
	^ typeName