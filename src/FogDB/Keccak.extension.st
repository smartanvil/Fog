Extension { #name : #Keccak }

{ #category : #'*FogDB' }
Keccak classSide >> hashEncode: aMessage [
	^ self new hashEncode: aMessage
]

{ #category : #'*FogDB' }
Keccak >> hashEncode: aMessage [
	^ (self hashMessage: aMessage) asByteArray hex
]
