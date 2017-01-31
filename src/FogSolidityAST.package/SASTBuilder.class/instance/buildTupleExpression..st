build-node
buildTupleExpression: aDictionaryNode
	| tuple entries |
	tuple := SASTTupleExpression new.
	entries := self buildNodes: (aDictionaryNode at: #children).
	tuple entries: entries.
	self setNodeValuesFrom: aDictionaryNode into: tuple.
	^ tuple