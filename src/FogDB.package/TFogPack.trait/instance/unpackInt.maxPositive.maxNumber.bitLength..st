unpack
unpackInt: aString maxPositive: size maxNumber: inverse bitLength: bitLength
	| uint |
	uint := 	self load: aString size: bitLength .
	uint > inverse
		ifTrue: [ self error: ' Number is not expressed in the given size ' ].
	^ uint <= size
		ifTrue: [ uint ]
		ifFalse: [ uint - inverse ]