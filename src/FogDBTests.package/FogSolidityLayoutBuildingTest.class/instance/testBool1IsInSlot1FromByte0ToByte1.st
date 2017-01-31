layout calculations
testBool1IsInSlot1FromByte0ToByte1
	| map |
	map := (mirror properties at: 2) layout.
	self assert: map fromSlot equals: 0.
	self assert: map toSlot equals: 0.
	self assert: map fromByte equals: 20.
	self assert: map toByte equals: 20