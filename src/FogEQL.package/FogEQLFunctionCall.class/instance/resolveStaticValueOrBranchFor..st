as yet unclassified
resolveStaticValueOrBranchFor: aFogEQLResultStream
	| names |
	^ (self needsBinding not)
		ifTrue: [ self reduce ]
		ifFalse: [ names := arguments select: [ :n | n isFogName ].
			self assert: names size = 1.
			names first resolveStaticValueOrBranchFor: aFogEQLResultStream ]