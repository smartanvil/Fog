layout calculations
testOwnerIsInSlot0FromByte0ToByte19
	| map |
	map := (mirror properties at: 1) layout.
	self assert: map fromSlot equals: 0.
	self assert: map toSlot equals: 0.
	self assert: map fromByte equals: 0.
	self assert: map toByte equals: 19