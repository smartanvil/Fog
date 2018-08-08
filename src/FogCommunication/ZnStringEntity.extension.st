Extension { #name : #ZnStringEntity }

{ #category : #'*FogCommunication' }
ZnStringEntity class >> json: string [
	^ (self type: ZnMimeType applicationJson)
		string: string;
		yourself
]
