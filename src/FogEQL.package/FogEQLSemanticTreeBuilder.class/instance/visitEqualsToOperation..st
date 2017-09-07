as yet unclassified
visitEqualsToOperation: anEQLEqualsToOperationNode
	^ FogEQLEqualsOperator new
		left: (anEQLEqualsToOperationNode left_exp acceptVisitor: self);
		right: (anEQLEqualsToOperationNode right_exp acceptVisitor: self);
		yourself