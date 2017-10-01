visiting
visitMethodCall: anEQLMethodCallNode
	^ FogEQLMethodCall new
		receiver: (anEQLMethodCallNode value acceptVisitor: self);
		selector: (anEQLMethodCallNode selector acceptVisitor: self);
		arguments: (anEQLMethodCallNode arguments acceptVisitor: self);
		yourself