as yet unclassified
visitSubstractOperation: anEQLSubstractOperationNode
	^ FogEQLMinusOperator new
		left: (anEQLSubstractOperationNode left_exp acceptVisitor: self);
		right: (anEQLSubstractOperationNode right_exp acceptVisitor: self);
		yourself