as yet unclassified
resolve
	^ receiver isEVMLiteral
		ifTrue: [ (receiver literalValue asBKNumber
				perform: selector
				withArguments: (arguments collect: [ :a | a literalValue asBKNumber ])) asBKHexa ]
		ifFalse: [ nil ]