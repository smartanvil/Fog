as yet unclassified
visitMethodCall: anEQLMethodCallNode
	self shouldBeImplemented.
	^ FogEQLMethodCall new
		receiver: (anEQLMethodCallNode value acceptVisitor: self);
		selector: (anEQLMethodCallNode selector acceptVisitor: self);
		arguments: (anEQLMethodCallNode arguments acceptVisitor: self);
		yourself