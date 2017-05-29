visiting
visitIszero: aFogVMIszero 
	stack
		push:
			(stack pop asBKNumber = 0
				ifTrue: [ 1 ]
				ifFalse: [ 0 ])