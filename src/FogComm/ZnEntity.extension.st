Extension { #name : #ZnEntity }

{ #category : #'*FogComm' }
ZnEntity class >> json: text [
	^ self stringEntityClass json: text
]
