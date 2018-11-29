Extension { #name : #SolFunctionDefinitionNode }

{ #category : #'*FogLive' }
SolFunctionDefinitionNode >> isConstant [
	^ modifiers anySatisfy: #isConstant
]

{ #category : #'*FogLive' }
SolFunctionDefinitionNode >> isConstructor [
	^ identifier value = parent identifier value 
]

{ #category : #'*FogLive' }
SolFunctionDefinitionNode class >> kind [
	^ #'function-definition'
]
