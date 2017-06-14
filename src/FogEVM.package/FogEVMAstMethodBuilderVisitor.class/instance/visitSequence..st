visiting
visitSequence: aFogEVMSequence
	self installSequence: aFogEVMSequence.
	[ self hasNextStatement ]
		whileTrue: [ | stat |
			stat := self nextStatement.
			self visitSequenceStatement: stat ]