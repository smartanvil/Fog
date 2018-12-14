Extension { #name : #Number }

{ #category : #'*FogComm' }
Number >> asHeadlessHexa [
	^ (self hex asString copyReplaceAll: '16r' with: '') asLowercase
]
