as yet unclassified
visitNotOperation: anEQLNotOperationNode
	^ FogEQLNotOperator new expression: (anEQLNotOperationNode exp acceptVisitor: self)