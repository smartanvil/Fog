visiting
visitGreaterEqualsThanOperation: aBinaryOperation
	^ FogEQLGreaterEqualsOperator new
		left: (aBinaryOperation left_exp acceptVisitor: self);
		right: (aBinaryOperation right_exp acceptVisitor: self);
		yourself