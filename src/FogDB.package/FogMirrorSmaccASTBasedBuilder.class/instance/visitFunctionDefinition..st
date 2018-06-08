as yet unclassified
visitFunctionDefinition: aSolFunctionDefinitionNode
	aSolFunctionDefinitionNode parameters parameters do: [ :t | t acceptVisitor: self ].
	aSolFunctionDefinitionNode returned_types ifNotNil: [ :ret | ret parameters do: [ :t | t acceptVisitor: self ] ].
	aSolFunctionDefinitionNode isConstructor
		ifTrue: [ constructor := self createConstructor: aSolFunctionDefinitionNode ]
		ifFalse: [ methods add: (self createMethod: aSolFunctionDefinitionNode) ]