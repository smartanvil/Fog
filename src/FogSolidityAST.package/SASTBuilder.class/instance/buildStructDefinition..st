build-node
buildStructDefinition: aDictionaryNode
	| struct |
	struct := SASTStruct new.
	self buildNodes: (aDictionaryNode at: #children) into: struct.
	self setNodeValuesFrom: aDictionaryNode into: struct.
	types install: struct.
	^ struct