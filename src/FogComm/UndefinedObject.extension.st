Extension { #name : #UndefinedObject }

{ #category : #'*FogComm' }
UndefinedObject >> asAddress [
	^ 0 write0xHexadecimal
]
