visiting
visitArrayType: aSASTArrayType
	| inner |
	aSASTArrayType innerType accept: self.
	inner := types at: aSASTArrayType innerType .
	types
		at: aSASTArrayType
		put:
			(FogArrayType new
				inner: inner;
				yourself)