as yet unclassified
visitContractDefinition: aSolContractDefinitionNode 
	aSolContractDefinitionNode contract_sources do: [ : s | s acceptVisitor: self ].