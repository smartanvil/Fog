visiting
visitCodecopy: aFogVMCodecopy
	| codecopy |
	codecopy := FogEVMAstCodeCopy new.
	codecopy loadingArea: (self literalOrVariable: stack pop).
	codecopy fromInstruction: (self literalOrVariable: stack pop).
	codecopy amountOfInstructions: (self literalOrVariable: stack pop).
	self scope sequence addStatement: codecopy