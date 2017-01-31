as yet unclassified
accept: aVisitor
	^ aVisitor
		perform: ('visit' , (self class name copyReplaceAll: 'SAST' with: '') capitalized , ':') asSymbol
		withArguments: {self}