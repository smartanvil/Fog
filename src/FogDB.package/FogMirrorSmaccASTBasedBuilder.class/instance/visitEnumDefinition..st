as yet unclassified
visitEnumDefinition: aSolEnumDefinitionNode 
	^ types
		at: aSolEnumDefinitionNode
		put:
			(FogEnumType new
				values: (aSolEnumDefinitionNode enum_value_ids collect: #value);
				yourself)