Extension { #name : #SolFunctionDefinitionNode }

{ #category : #'*FogDB' }
SolFunctionDefinitionNode >> isConstant [
	^ modifiers anySatisfy: #isConstant
]

{ #category : #'*FogDB' }
SolFunctionDefinitionNode >> isConstructor [
	^ identifier value = parent identifier value 
]

{ #category : #'*FogDB' }
SolFunctionDefinitionNode classSide >> kind [
	^ #'function-definition'
]
