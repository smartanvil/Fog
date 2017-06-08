as yet unclassified
visitNot: aFogVMNot
	| variable |
	variable := self messageSend: #not receiver: (self literalOrVariable: stack pop) arguments: {}.
	stack push: variable