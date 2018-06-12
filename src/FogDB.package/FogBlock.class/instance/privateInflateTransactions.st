private
privateInflateTransactions
	^ transactionsHashes
		collect: [ :t | self session findTransactionByDescription: t ]