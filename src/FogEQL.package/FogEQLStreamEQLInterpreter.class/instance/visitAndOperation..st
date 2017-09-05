as yet unclassified
visitAndOperation: anEQLAndOperationNode
	^ FogEQLAndOperator new
		left: (anEQLAndOperationNode left_exp acceptVisitor: self);
		right: (anEQLAndOperationNode right_exp acceptVisitor: self);
		yourself