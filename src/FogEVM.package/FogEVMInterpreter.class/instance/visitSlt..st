visit - comparision
visitSlt: aFogVMSlt
	| element1 element2 pkr |
	pkr := FogPacker new.
	element1 := pkr unpackInt256: stack pop.
	element2 := pkr unpackInt256: stack pop.
	stack
		push:
			(element1 < element2
				ifTrue: [ 1 ]
				ifFalse: [ 0 ]) asBKHexa