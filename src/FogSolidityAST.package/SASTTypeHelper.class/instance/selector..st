as yet unclassified
selector: aString
	(aString indexOfSubCollection: 'type(') = 1
		ifTrue: [ ^ (aString copyFrom: 'type(' size + 1 to: aString size - 1) asSymbol ].
	aString = 'tuple()'
		ifTrue: [ ^ #tuple ].
	^ (' ' split: aString) first asSymbol