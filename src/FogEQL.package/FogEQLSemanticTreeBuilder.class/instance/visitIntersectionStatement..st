as yet unclassified
visitIntersectionStatement: anEQLIntersectionStatementNode 
	^ FogEQLIntersect new
		firstCollection: (anEQLIntersectionStatementNode left_collection acceptVisitor: self);
		secondCollection: (anEQLIntersectionStatementNode right_collection acceptVisitor: self);
		yourself