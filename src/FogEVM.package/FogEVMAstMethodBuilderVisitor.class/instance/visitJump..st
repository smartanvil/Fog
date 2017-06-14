visiting
visitJump: aJump
	(self isErrorHandlingJump: aJump)
		ifFalse: [ self visitAstNode: aJump.
			self setNextStatement: (self statementFor: aJump) ].
	visitedStatements add: nextNode