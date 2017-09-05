visiting
visitSumOperation: aBinaryOperation
	^ FogEQLPlusOperator new
		left: (aBinaryOperation left_exp acceptVisitor: self);
		right: (aBinaryOperation right_exp acceptVisitor: self);
		yourself