as yet unclassified
visitFunctionCall: anEQLFunctionCallNode
	^ FogEQLFunctionCall new
		selector: (anEQLFunctionCallNode selector acceptVisitor: self);
		arguments: (anEQLFunctionCallNode arguments acceptVisitor: self);
		yourself