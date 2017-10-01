visiting
visitComparisionOperator: aFogEQLGreaterOperator
	^ FogEQLBinaryOperation new
		left: (aFogEQLGreaterOperator left acceptVisitor: self);
		right: (aFogEQLGreaterOperator right acceptVisitor: self);
		operation: aFogEQLGreaterOperator operation;
		operationSymbol: aFogEQLGreaterOperator operationSymbol;
		yourself