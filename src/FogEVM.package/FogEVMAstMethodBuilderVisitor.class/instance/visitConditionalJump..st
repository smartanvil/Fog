visiting
visitConditionalJump: aConditionalJump
	inMethodBody
		ifTrue: [ method sequence
				addStatement:
					((self isErrorHandlingJump: aConditionalJump)
						ifTrue: [ self buildConditionalAbstractStructureForThrowing: aConditionalJump ]
						ifFalse: [ self buildConditionalAbstractStructureFor: aConditionalJump ]) ]