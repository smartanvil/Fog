as yet unclassified
buildForStatement: aCollection
	| for definition condition evaluation body children |
	children := aCollection at: #children.
	self assert: children size = 4.
	definition := self buildNode: (children at: 1).
	condition := self buildNode: (children at: 2).
	evaluation := self buildNode: (children at: 3).
	body := self buildNode: (children at: 4).
	for := SASTForStatement new.
	self setNodeValuesFrom: aCollection into: for.
	for
		variables: definition;
		condition: condition;
		evaluation: evaluation;
		body: body.
	^ for