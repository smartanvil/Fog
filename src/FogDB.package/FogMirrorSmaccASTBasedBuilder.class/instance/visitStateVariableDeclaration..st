as yet unclassified
visitStateVariableDeclaration: aSolStateVariableDeclarationNode
	| slot |
	aSolStateVariableDeclarationNode type acceptVisitor: self.
	slot := FogPropertyMirror new
		name: aSolStateVariableDeclarationNode identifierToken value;
		type: (types at: aSolStateVariableDeclarationNode type).
	variableSlots add: slot.
	slot id: (variableSlots indexOf: slot) - 1.
	contractSlots add: slot