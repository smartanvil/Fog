Extension { #name : #SolEnumDefinitionNode }

{ #category : #'*FogDB' }
SolEnumDefinitionNode >> isUserDefined [
	^ true
]

{ #category : #'*FogDB' }
SolEnumDefinitionNode classSide >> kind [
	^ #'type-definition'
]
