build-node
buildVariableDeclaration: aDictionaryNode
	| variable |
	variable := SASTVariable new.
	self buildNodes: (aDictionaryNode at: #children) into: variable.
	self setNodeValuesFrom: aDictionaryNode into: variable.
	^ variable