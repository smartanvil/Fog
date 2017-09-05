as yet unclassified
visitFunctionDefinition: aSolFunctionDefinitionNode
	aSolFunctionDefinitionNode param_list types do: [ :t | t acceptVisitor: self ].
	aSolFunctionDefinitionNode returned_types ifNotNil: [ :ret | ret types do: [ :t | t acceptVisitor: self ] ].
	aSolFunctionDefinitionNode isConstructor
		ifTrue: [ constructor := self createConstructor: aSolFunctionDefinitionNode ]
		ifFalse: [ methods add: (self createMethod: aSolFunctionDefinitionNode) ]