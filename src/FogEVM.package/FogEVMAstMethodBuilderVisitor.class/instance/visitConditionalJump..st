visiting
visitConditionalJump: aConditionalJump
	method sequence
		addStatement:
			((self isErrorHandlingJump: aConditionalJump)
				ifTrue: [ self buildConditionalAbstractStructureForThrowing: aConditionalJump ]
				ifFalse: [ self buildConditionalAbstractStructureFor: aConditionalJump ])