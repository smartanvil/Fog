visiting
visitOrOperation: anEQLAndOperationNode
	^ FogEQLOrOperator new
		left: (anEQLAndOperationNode left_exp acceptVisitor: self);
		right: (anEQLAndOperationNode right_exp acceptVisitor: self);
		yourself