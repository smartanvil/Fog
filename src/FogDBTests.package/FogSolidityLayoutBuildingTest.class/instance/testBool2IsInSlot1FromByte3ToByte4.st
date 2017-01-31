layout calculations
testBool2IsInSlot1FromByte3ToByte4
	| map |
	map := (mirror properties at: 5) layout.
	self assert: map fromSlot equals: 2.
	self assert: map toSlot equals: 2.
	self assert: map fromByte equals: 0.
	self assert: map toByte equals: 0