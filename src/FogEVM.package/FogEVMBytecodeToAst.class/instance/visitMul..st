as yet unclassified
visitMul: aFogVMMul
	| variable |
	variable := self binaryMessageSend: #* receiver: (self literalOrVariable: stack pop) argument: (self literalOrVariable: stack pop).
	stack push: variable