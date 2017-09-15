tx-amount-indx
generateBlockTxAmountIndex
	| index |
	index := Array new: blocks size.
	1 to: blocks size do: [ :i | self extractBlockTxAmountIndexEntry: i into: index ].
	^ (self sortTxAmountArray:index) asArray.