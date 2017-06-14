visiting
visitJump: aFogEVMAstJump
	(self isErrorHandlingJump: aFogEVMAstJump)
		ifTrue: [ finished := true ]
		ifFalse: [ super visitJump: aFogEVMAstJump ]