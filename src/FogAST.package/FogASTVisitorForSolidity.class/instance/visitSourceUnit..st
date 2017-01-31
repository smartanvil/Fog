as yet unclassified
visitSourceUnit: aSASTSourceUnit
	| context units |
	
	units := aSASTSourceUnit units collect: [ :u | u accept: self ] thenSelect: #isNotNil.
	context := self createGeneralContext.
	units do: [ :u | u registerInto: context ].
	^ context