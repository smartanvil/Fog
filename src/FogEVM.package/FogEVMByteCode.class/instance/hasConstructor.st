converting
hasConstructor
	| copyCodes shouldByPush10x0 shouldBeReturn |
	copyCodes := content select: [ :i | i instruction isCopyCode ].
	copyCodes isEmpty
		ifTrue: [ ^ false ].
	self assert: copyCodes size = 1.
	shouldByPush10x0 := (content indexOf: (copyCodes at: 1)) + 1.
	shouldBeReturn := shouldByPush10x0 + 1.
	^ (content at: shouldByPush10x0) instruction = FogVMPush1 instance0x00
		and: [ (content at: shouldBeReturn) instruction = FogVMReturn instance ]