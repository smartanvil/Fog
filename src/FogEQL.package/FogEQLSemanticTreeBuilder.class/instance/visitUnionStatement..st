as yet unclassified
visitUnionStatement: anEQLUnionStatementNode
	^ FogEQLUnion new
		firstCollection: (anEQLUnionStatementNode left_collection acceptVisitor: self);
		secondCollection: (anEQLUnionStatementNode right_collection acceptVisitor: self);
		yourself