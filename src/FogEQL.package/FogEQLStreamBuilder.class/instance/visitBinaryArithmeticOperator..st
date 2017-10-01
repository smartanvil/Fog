as yet unclassified
visitBinaryArithmeticOperator: aFogEQLPlusOperator 
	^ FogEQLBinaryOperation new
		left: (aFogEQLPlusOperator left acceptVisitor: self);
		right: (aFogEQLPlusOperator right acceptVisitor: self);
		operation: aFogEQLPlusOperator operation;
		operationSymbol: aFogEQLPlusOperator operation;
		yourself