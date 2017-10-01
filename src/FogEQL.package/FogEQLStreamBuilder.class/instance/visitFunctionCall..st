visiting
visitFunctionCall: aFogEQLFunctionCall
	| method |
	method := FogEQLMethod new
		receiver: FogEQLDynamicGlobals value functions;
		selector: (aFogEQLFunctionCall selector acceptVisitor: self);
		arguments: (aFogEQLFunctionCall arguments collect: [ :a | a acceptVisitor: self ]);
		yourself.
	^ method needsBinding
		ifTrue: [ method ]
		ifFalse: [ method reduce ]