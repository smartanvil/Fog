as yet unclassified
visitContractDefinition: aSolContractDefinitionNode
	aSolContractDefinitionNode typeDefinitions do: [ :s | s acceptVisitor: self ].
	aSolContractDefinitionNode declarations do: [ :s | s acceptVisitor: self ].
	aSolContractDefinitionNode eventDefinitions do: [ :s | s acceptVisitor: self ].
	aSolContractDefinitionNode modifierDefinitions do: [ :s | s acceptVisitor: self ].
	aSolContractDefinitionNode functionDefinitions do: [ :s | s acceptVisitor: self ].
	aSolContractDefinitionNode defaultNodes do: [ :s | s acceptVisitor: self ]