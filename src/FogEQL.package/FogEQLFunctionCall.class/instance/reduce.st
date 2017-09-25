truncation and round off
reduce
	| args |
	args := arguments
		collect: [ :a | 
			a isFogFunction
				ifTrue: [ a reduce ]
				ifFalse: [ a ] ].
	^ self reduceUsing: args and: FogEQLDynamicGlobals value