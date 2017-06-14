as yet unclassified
resolve
	^ (receiver literalValue asBKNumber
		perform: selector
		withArguments: (arguments collect: [ :a | a literalValue asBKNumber ])) asBKHexa