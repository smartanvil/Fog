as yet unclassified
extractFromInstalledSequence
	method := FogEVMAstMethod new.
	hasEntered := inMethodBody := true.
	self assert: nextNode ~= 1.
	[ self hasNextStatement ]
		whileTrue: [ | stat |
			stat := self nextStatement.
			self visitSequenceStatement: stat ]