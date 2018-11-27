Extension { #name : #Number }

{ #category : #'*FogCommunication' }
Number >> asBKHexa [
	^ (self hex asString copyReplaceAll: '16r' with: '0x') asLowercase
]

{ #category : #'*FogCommunication' }
Number >> asBKHexa: aLength [
	^ (self hex asString copyReplaceAll: '16r' with: '') asLowercase
		padLeftTo: aLength
		with: $0
]

{ #category : #'*FogCommunication' }
Number >> asBKNumber [
	^ self
]

{ #category : #'*FogCommunication' }
Number >> asHeadlessHexa [
	^ (self hex asString copyReplaceAll: '16r' with: '') asLowercase
]
