instance creation
for: anObject
	anObject isString
		ifFalse: [ self halt: 'should be a string' ].
	^ self literals
		detect: [ :l | l literalValue = anObject ]
		ifNone: [ self literals
				add:
					(self new
						literalValue: anObject;
						yourself) ]