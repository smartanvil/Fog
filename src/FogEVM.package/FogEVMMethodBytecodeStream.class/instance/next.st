accessing
next
	(collection at: position + 1) instruction isStrictJump
		ifTrue: [ self assert: (collection at: position)instruction isPush ].
	^ super next