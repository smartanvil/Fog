as yet unclassified
visitSlt: aFogVMSlt
	| variable |
	variable := self
		messageSend: #signedIsLesserThan:
		receiver: (self literalOrVariable: stack pop)
		arguments: {(self literalOrVariable: stack pop)}.
	stack push: variable