as yet unclassified
visitEnumDefinition: aSolEnumDefinitionNode 
	^ types
		at: aSolEnumDefinitionNode
		put:
			(FogEnumType new
				values: (aSolEnumDefinitionNode values acceptVisitor: self);
				yourself)