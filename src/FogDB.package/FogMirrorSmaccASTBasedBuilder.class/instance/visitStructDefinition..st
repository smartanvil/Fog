as yet unclassified
visitStructDefinition: aSolStructDefinitionNode 
	^ types
		at: aSolStructDefinitionNode
		put:
			(FogStructType new
				fields:
					(aSolStructDefinitionNode fields 
						collect: [ :f | 
							f type acceptVisitor: self.
							FogStructField new
								name: (f identifier acceptVisitor:self);
								type: (types at: f type);
								yourself ]);
				yourself)