as yet unclassified
visitVariable: aSASTVariable
	| property |
	property := aSASTVariable isConstant
		ifTrue: [ FogASTConstantProperty new
				value: aSASTVariable value;
				yourself ]
		ifFalse: [ FogASTProperty new ].
	property name: aSASTVariable name.
	property type: (aSASTVariable type accept: self).
	^ property