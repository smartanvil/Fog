visiting
visitStruct: aSASTStruct
	^ types
		at: aSASTStruct
		put:
			(FogStructType new
				fields:
					(aSASTStruct fields
						collect: [ :f | 
							f type accept: self.
							FogStructField new
								name: f name;
								type: (types at: f type);
								yourself ]);
				yourself)