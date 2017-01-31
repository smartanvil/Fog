layout calculations
testSimpleExampleIsInSlot2And3FromByte0ToByte
	| map |
	map := (mirror properties at: 4) layout.
	self assert: map fromSlot equals: 1.
	self assert: map toSlot equals: 1.
	self assert: map fromByte equals: 0.
	self assert: map toByte equals: 5