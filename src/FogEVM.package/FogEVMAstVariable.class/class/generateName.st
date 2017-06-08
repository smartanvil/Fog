as yet unclassified
generateName
	| gen |
	gen := 'TVar-{1}' format: {lastNumber}.
"	self haltIf: lastNumber = 77."
	lastNumber := lastNumber + 1.
	^ gen