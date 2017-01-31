as yet unclassified
matches: aString
	| pieces mapping pairOfTypes |
	pieces := '(' split: aString.
	mapping := pieces at: 1.
	mapping = 'mapping'
		ifFalse: [ ^ false ].
	(keyType isNil or: [ valueType isNil ])
		ifTrue: [ ^ false ].
	pairOfTypes := '=> ' split: (pieces at: 2).
	^ (keyType matches: (pairOfTypes at: 1)) and: [ valueType matches: (pairOfTypes at: 2) ]