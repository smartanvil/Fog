as yet unclassified
booleanToHexa: aBoolean
	^ (aBoolean
		ifTrue: [ 1 ]
		ifFalse: [ 0 ]) asBKHexa