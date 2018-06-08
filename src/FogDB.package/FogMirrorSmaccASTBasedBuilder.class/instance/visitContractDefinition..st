visiting
visitContractDefinition: aSolContractDefinitionNode
	aSolContractDefinitionNode statements do: [ :cs | cs acceptVisitor: self ]