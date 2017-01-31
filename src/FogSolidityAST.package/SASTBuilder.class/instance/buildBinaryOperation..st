build-node
buildBinaryOperation: aDictionaryNode
	| binary children left right |
	binary := SASTBinaryOperation new.
	children := aDictionaryNode at: #children.
	self assert: children size = 2.
	left := self buildNode: children first.
	right := self buildNode: children second.
	self setNodeValuesFrom: aDictionaryNode into: binary.
	^ binary
		left: left;
		right: right;
		yourself