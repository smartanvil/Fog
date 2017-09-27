visiting
visitMethodCall: anEQLMethodCallNode
	^ FogEQLMethodCall new
		receiver: (self visitMemberAccess: anEQLMethodCallNode);
		selector: (anEQLMethodCallNode selector acceptVisitor: self);
		arguments: (anEQLMethodCallNode arguments acceptVisitor: self);
		yourself