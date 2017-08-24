tx-amount-indx
extractBlockTxAmountIndexEntry: anInteger into: aCollection 
	| hash txs | 
	hash := (blocks at: anInteger) at:1 .
	txs := ((blocks at: anInteger) at:5) ifNotNil: [ : i | i size ].
	aCollection at: anInteger put: { txs . hash }.