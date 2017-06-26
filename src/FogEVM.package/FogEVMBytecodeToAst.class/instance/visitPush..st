visiting
visitPush: aFogVMPush1
	| variable assignation literal |
	literal := self literalOrVariable: aFogVMPush1 parameter.
	variable := self assignToTemporaryVariable: literal.
	stack push: variable