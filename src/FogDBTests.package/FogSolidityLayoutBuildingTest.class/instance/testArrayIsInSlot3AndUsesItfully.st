layout calculations
testArrayIsInSlot3AndUsesItfully
	| map |
	map := (mirror properties at: 6) layout.
	self assert: map fromSlot equals: 3.
	self assert: map toSlot equals: 3.
	self assert: map fromByte equals: 0.
	self assert: map toByte equals: 31