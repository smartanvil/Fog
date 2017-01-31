build-node
buildExpressionStatement: aDictionaryNode
	| expression |
	expression := SASTExpressionStatement new.
	expression statements: (self buildNodes: (aDictionaryNode at: #children)).
	self setNodeValuesFrom: aDictionaryNode into: expression.
	^ expression