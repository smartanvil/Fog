Extension { #name : #SolStructDefinitionNode }

{ #category : #'*FogLive' }
SolStructDefinitionNode >> compositeNodeVariables [
	^ #(#fields)
]

{ #category : #'*FogLive' }
SolStructDefinitionNode >> isUserDefined [
	^ true
]

{ #category : #'*FogLive' }
SolStructDefinitionNode class >> kind [
	^ #'type-definition'
]
