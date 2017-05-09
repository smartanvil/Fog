as yet unclassified
visitEnum: aSASTEnum
	^ types
		at: aSASTEnum
		put:
			(FogEnumType new
				values: (aSASTEnum values collect: #name);
				yourself)