visiting
visitMapping: aSASTMapping
	| key value |
	aSASTMapping keyType accept: self.
	aSASTMapping valueType accept: self.
	key := types at: aSASTMapping keyType.
	value := types at: aSASTMapping valueType.
	types
		at: aSASTMapping
		put:
			(FogMappingType new
				keyType: key;
				valueType: value)