Extension { #name : #BlockClosure }

{ #category : #'*FogComm' }
BlockClosure >> && anOtherValuable [
	^ [ self value and: anOtherValuable ]
]

{ #category : #'*FogComm' }
BlockClosure >> not [
	^ [ self value not ]
]

{ #category : #'*FogComm' }
BlockClosure >> || anOtherValuable [
	^ [ self value or: anOtherValuable ]
]
