as yet unclassified
buildVariableDefinitionStatement: aCollection
	| children variable |
	children := aCollection at: #children.
	self assert: children size <= 2.
	variable := self buildNode: (children at: 1).
	variable maybeConstant: false.
	children size = 2
		ifTrue: [ variable addLiteral: (self buildNode: (children at: 2)) ].
	^ variable