Extension { #name : #ZnEntity }

{ #category : #'*FogCommunication' }
ZnEntity class >> json: text [
	^ self stringEntityClass json: text
]
