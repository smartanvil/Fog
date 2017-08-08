as yet unclassified
visitArrayTypeName: aSolArrayTypeNameNode 
	| inner |
	aSolArrayTypeNameNode type acceptVisitor: self.
	inner := types at: aSolArrayTypeNameNode type .
	types
		at: aSolArrayTypeNameNode
		put:
			(FogArrayType new
				inner: inner;
				yourself)