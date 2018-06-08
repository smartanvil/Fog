marshaling
staticSlotSize
	^ self class perform: ('sizeOf' , name capitalized) asSymbol