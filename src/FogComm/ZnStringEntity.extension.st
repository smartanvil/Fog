Extension { #name : #ZnStringEntity }

{ #category : #'*FogComm' }
ZnStringEntity class >> json: string [
	^ (self type: ZnMimeType applicationJson)
		string: string;
		yourself
]
