Extension { #name : #SolContractDefinitionNode }

{ #category : #'*FogLive' }
SolContractDefinitionNode >> eventDefinitions [
	^ self contract_sources select:[ : c | c class kind = #'event-definition' ]
]

{ #category : #'*FogLive' }
SolContractDefinitionNode >> functionDefinitions [
	^ self contract_sources select:[ : c | c class kind = #'function-definition' ]
]

{ #category : #'*FogLive' }
SolContractDefinitionNode >> isContract [
	^ true 
]

{ #category : #'*FogLive' }
SolContractDefinitionNode class >> kind [
	^ #'type-definition'
]

{ #category : #'*FogLive' }
SolContractDefinitionNode >> modifierDefinitions [
	^ self contract_sources select:[ : c | c class kind = #'modifier-definition' ]
]
