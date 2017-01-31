build-node
buildReturn: aDictionaryNode
	| return children |
	return := SASTReturn new.
	children := aDictionaryNode at: #children.
	return returnable: (self buildNode: children first).
	self setNodeValuesFrom: aDictionaryNode into: return.
	^ return