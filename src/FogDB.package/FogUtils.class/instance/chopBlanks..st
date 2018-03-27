private
chopBlanks: aString
	| rslt |
	aString size = 0
		ifTrue: [ ^ aString ].
	rslt := (String crlf , ' ' includes: aString first)
		ifTrue: [ self chopBlanks: (aString copyFrom: 2 to: aString size) ]
		ifFalse: [ aString ].
	rslt size = 0
		ifTrue: [ ^ rslt ].
	rslt := (String crlf , ' ' includes: rslt last)
		ifTrue: [ self chopBlanks: (rslt copyFrom: 1 to: rslt size - 1) ]
		ifFalse: [ rslt ].
	^ rslt