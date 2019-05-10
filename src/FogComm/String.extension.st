Extension { #name : #String }

{ #category : #'*FogComm' }
String >> asAddress [
	^ (self beginsWith: '0x')
		ifTrue: [ self ]
		ifFalse: [ '0x' , self ]
]

{ #category : #'*FogComm' }
String >> asPackingAddress [
	^ self copyReplaceAll: '0x' with: ''
]
