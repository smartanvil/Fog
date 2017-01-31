layout calculations
testMidintIsInSlot1FromByte1ToByte3
	| map |
	map := (mirror properties at: 3) layout.
	self assert: map fromSlot equals: 0.
	self assert: map toSlot equals: 0.
	self assert: map fromByte equals: 21.
	self assert: map toByte equals: 22