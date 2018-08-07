Extension { #name : #SmallInteger }

{ #category : #'*FogEVM' }
SmallInteger >> isEVMMessageSend [
	^ false 
]

{ #category : #'*FogEVM' }
SmallInteger >> literalValue [
	^ self
]
