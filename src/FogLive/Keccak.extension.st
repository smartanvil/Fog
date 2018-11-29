Extension { #name : #Keccak }

{ #category : #'*FogLive' }
Keccak class >> hashEncode: aMessage [
	^ self new hashEncode: aMessage
]

{ #category : #'*FogLive' }
Keccak >> hashEncode: aMessage [
	^ (self hashMessage: aMessage) asByteArray hex
]
