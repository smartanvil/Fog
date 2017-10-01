visiting
visitMethodCall: aFogEQLMethodCall
	| method |
	method := FogEQLMethod new
		receiver: (aFogEQLMethodCall receiver  acceptVisitor: self);
		selector: (aFogEQLMethodCall selector acceptVisitor: self);
		arguments: (aFogEQLMethodCall arguments collect: [ :a | a acceptVisitor: self ]);
		yourself.
	^ method needsBinding
		ifTrue: [ method ]
		ifFalse: [ method reduce ]