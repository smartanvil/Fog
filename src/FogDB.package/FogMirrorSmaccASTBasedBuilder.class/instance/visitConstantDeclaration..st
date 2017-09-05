visiting
visitConstantDeclaration: aSolConstantDeclarationNode
	| slot |
	aSolConstantDeclarationNode type acceptVisitor: self.
	slot := FogConstantMirror new
		name: aSolConstantDeclarationNode identifierToken value;
		type: (types at: aSolConstantDeclarationNode type);
		constant: aSolConstantDeclarationNode constantToken value.
	contractSlots add: slot.