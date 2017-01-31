visiting
visitVariable: aSASTVariable
	| slot |
	aSASTVariable type accept: self.
	slot := aSASTVariable isConstant
		ifTrue: [ FogContractConstantMirror new
				name: aSASTVariable name;
				type: (types at: aSASTVariable type);
				constant: aSASTVariable value ]
		ifFalse: [ slot := FogContractPropertyMirror new
				name: aSASTVariable name;
				type: (types at: aSASTVariable type).
			variableSlots add: slot.
			slot id: (variableSlots indexOf: slot) - 1 ].
	contractSlots add: slot