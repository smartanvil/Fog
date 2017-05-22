as yet unclassified
createSubclassFor: aMnemoic
	^ FogEVMInstruction
		subclass: ('FogVM' , aMnemoic asLowercase capitalized) asSymbol
		instanceVariableNames: ''
		classVariableNames: ''
		package: 'FogEVMByteCode'