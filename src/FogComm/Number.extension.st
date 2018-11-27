Extension { #name : #Number }

{ #category : #'*FogComm' }
Number >> asBKHexa [
	^ (self hex asString copyReplaceAll: '16r' with: '0x') asLowercase
]

{ #category : #'*FogComm' }
Number >> asBKHexa: aLength [
	^ (self hex asString copyReplaceAll: '16r' with: '') asLowercase
		padLeftTo: aLength
		with: $0
]

{ #category : #'*FogComm' }
Number >> asBKNumber [
	^ self
]

{ #category : #'*FogComm' }
Number >> asHeadlessHexa [
	^ (self hex asString copyReplaceAll: '16r' with: '') asLowercase
]
