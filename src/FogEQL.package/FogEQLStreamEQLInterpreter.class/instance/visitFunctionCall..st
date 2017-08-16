as yet unclassified
visitFunctionCall: anEQLFunctionCallNode
	^ FogEQLFunctionCall new
		name: (anEQLFunctionCallNode function_name acceptVisitor: self);
		arguments: (anEQLFunctionCallNode arguments acceptVisitor: self);
		yourself