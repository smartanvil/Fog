as yet unclassified
buildUnaryOperation: aDictionaryNode
	| unary child attributes |
	unary := SASTUnaryOperation new.
	child := aDictionaryNode at: #children.
	attributes := aDictionaryNode at: #attributes.
	self assert: child size = 1.
	unary subject: (self buildNode: (child at: 1)).
	unary type: (types resolve: (attributes at: #type)).
	unary prefix: (attributes at: #prefix).
	unary operator: (attributes at: #operator).
	^ unary