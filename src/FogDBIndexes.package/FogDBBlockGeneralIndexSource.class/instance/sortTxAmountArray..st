tx-amount-indx
sortTxAmountArray: aTxAmountArray
	^ (aTxAmountArray select: [ :i | i isNotNil and: [ (i at: 1) isNotNil ] ])
		asSortedCollection: [ :i :j | (i at: 1) < (j at: 1) ]