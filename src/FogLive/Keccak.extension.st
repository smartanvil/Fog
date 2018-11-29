Extension { #name : #Keccak }

{ #category : #'*FogLive' }
Keccak >> hashEncode: aMessage [
	^ (self hashMessage: aMessage) asByteArray hex
]

{ #category : #'*FogLive' }
Keccak class >> hashEncode: aMessage [
	^ self new hashEncode: aMessage
]
