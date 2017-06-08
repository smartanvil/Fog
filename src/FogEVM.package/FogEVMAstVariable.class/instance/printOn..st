printing
printOn: aStream
	"'	self type printOn: aStream.'"

	self isConstant
		ifTrue: [ value isEVMLiteral
				ifTrue: [ aStream nextPutAll: 'CONST('.
					value printOn: aStream.
					aStream nextPutAll: ')'.
					^ self ] ].
	aStream nextPutAll: ' '.
	aStream nextPutAll: self name