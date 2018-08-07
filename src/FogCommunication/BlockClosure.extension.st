Extension { #name : #BlockClosure }

{ #category : #'*FogCommunication' }
BlockClosure >> && anOtherValuable [
	^ [ self value and: anOtherValuable ]
]

{ #category : #'*FogCommunication' }
BlockClosure >> not [
	^ [ self value not ]
]

{ #category : #'*FogCommunication' }
BlockClosure >> || anOtherValuable [
	^ [ self value or: anOtherValuable ]
]
