visiting
visitContractDefinition: aSolContractDefinitionNode
	aSolContractDefinitionNode contract_sources do: [ :cs | cs acceptVisitor: self ]