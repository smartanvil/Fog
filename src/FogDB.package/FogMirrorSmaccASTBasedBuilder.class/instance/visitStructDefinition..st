as yet unclassified
visitStructDefinition: aSolStructDefinitionNode 
	^ types
		at: aSolStructDefinitionNode
		put:
			(FogStructType new
				fields:
					(aSolStructDefinitionNode struct_var_decs 
						collect: [ :f | 
							f type acceptVisitor: self.
							FogStructField new
								name: f identifierToken value;
								type: (types at: f type);
								yourself ]);
				yourself)