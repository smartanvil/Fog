unpack
unpackInt: aString maxPositive: size maxNumber: inverse
	| uint |
	uint := aString asBKNumber.
	uint > inverse ifTrue: [ self error: ' Number is not expressed in the given size ' ].
	^ uint <= size
		ifTrue: [ uint ]
		ifFalse: [ uint - inverse ]