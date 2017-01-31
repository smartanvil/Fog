build-node
buildAssignment: aDictionaryNode
	| assingment variable value children |
	assingment := SASTAssignment new.
	children := aDictionaryNode at: #children.
	self assert: children size = 2.
	variable := self buildNode: children first.
	value := self buildNode: children second.
	assingment
		variable: variable;
		value: value.
	self setNodeValuesFrom: aDictionaryNode into: assingment.
	^ assingment