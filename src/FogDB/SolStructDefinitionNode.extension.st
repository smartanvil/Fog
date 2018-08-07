Extension { #name : #SolStructDefinitionNode }

{ #category : #'*FogDB' }
SolStructDefinitionNode >> compositeNodeVariables [
	^ #(#fields)
]

{ #category : #'*FogDB' }
SolStructDefinitionNode >> isUserDefined [
	^ true
]

{ #category : #'*FogDB' }
SolStructDefinitionNode classSide >> kind [
	^ #'type-definition'
]
