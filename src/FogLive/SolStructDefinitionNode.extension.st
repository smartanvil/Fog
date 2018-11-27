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
SolStructDefinitionNode class >> kind [
	^ #'type-definition'
]
