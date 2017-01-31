build-node
buildMemberAccess: aDictionaryNode
	| expression children |
	expression := SASTMemberAccess new.
	children := aDictionaryNode at: #children.
	self assert: children size = 1.
	expression accessable: (self buildNode: children first).
	self setNodeValuesFrom: aDictionaryNode into: expression.
	^ expression