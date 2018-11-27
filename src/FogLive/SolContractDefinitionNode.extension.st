Extension { #name : #SolContractDefinitionNode }

{ #category : #'*FogDB' }
SolContractDefinitionNode >> eventDefinitions [
	^ self contract_sources select:[ : c | c class kind = #'event-definition' ]
]

{ #category : #'*FogDB' }
SolContractDefinitionNode >> functionDefinitions [
	^ self contract_sources select:[ : c | c class kind = #'function-definition' ]
]

{ #category : #'*FogDB' }
SolContractDefinitionNode >> isContract [
	^ true 
]

{ #category : #'*FogDB' }
SolContractDefinitionNode class >> kind [
	^ #'type-definition'
]

{ #category : #'*FogDB' }
SolContractDefinitionNode >> modifierDefinitions [
	^ self contract_sources select:[ : c | c class kind = #'modifier-definition' ]
]
