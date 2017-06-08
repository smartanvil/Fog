as yet unclassified
visitOr: aFogVMOr
	| variable |
	variable := self binaryMessageSend: #'||' receiver: (self literalOrVariable: stack pop) argument: (self literalOrVariable: stack pop).
	stack push: variable