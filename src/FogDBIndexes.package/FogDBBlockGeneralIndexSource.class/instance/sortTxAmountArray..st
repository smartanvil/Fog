tx-amount-indx
sortTxAmountArray: aTxAmountArray
	^ aTxAmountArray
		asSortedCollection: [ :i :j | 
			i
				ifNil: [ false ]
				ifNotNil: [ j
						ifNil: [ true ]
						ifNotNil: [ ((i at: 1) isNotNil and: [ (j at: 1) isNotNil ])
								ifTrue: [ (i at: 1) > (j at: 1) ]
								ifFalse: [ (j at: 1) isNil ] ] ] ]