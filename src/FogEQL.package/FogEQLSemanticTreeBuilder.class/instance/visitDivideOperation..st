as yet unclassified
visitDivideOperation: aBinaryOperation 
	^ FogEQLDivideOperator new
		left: (aBinaryOperation left_exp acceptVisitor: self);
		right: (aBinaryOperation right_exp acceptVisitor: self);
		yourself