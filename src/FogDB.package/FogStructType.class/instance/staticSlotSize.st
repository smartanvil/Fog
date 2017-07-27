testing
staticSlotSize
	^ fields inject: 0 into: [ :acc :f | acc + f type staticSlotSize  ]