Extension { #name : #SolEnumDefinitionNode }

{ #category : #'*FogLive' }
SolEnumDefinitionNode >> isUserDefined [
	^ true
]

{ #category : #'*FogLive' }
SolEnumDefinitionNode class >> kind [
	^ #'type-definition'
]
