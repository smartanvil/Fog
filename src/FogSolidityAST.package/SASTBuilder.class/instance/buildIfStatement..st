build-node
buildIfStatement: aDictionaryNode
	| if children |
	if := SASTIfStatement new.
	children := aDictionaryNode at: #children.
	self assert: (children size > 1 and: [ children size < 4 ]).
	if condition: (self buildNode: children first).
	if trueBranch: (self buildNode: children second).
	if
		falseBranch:
			(children size = 3
				ifTrue: [ self buildNode: children third ]
				ifFalse: [ nil ]).
	self setNodeValuesFrom: aDictionaryNode into: if.
	^ if