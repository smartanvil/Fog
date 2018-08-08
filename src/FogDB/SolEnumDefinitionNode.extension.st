Extension { #name : #SolEnumDefinitionNode }

{ #category : #'*FogDB' }
SolEnumDefinitionNode >> isUserDefined [
	^ true
]

{ #category : #'*FogDB' }
SolEnumDefinitionNode class >> kind [
	^ #'type-definition'
]
