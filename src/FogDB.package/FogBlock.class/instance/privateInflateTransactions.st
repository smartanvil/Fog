private
privateInflateTransactions
	^ transactionsHashes
		collect: [ :t | self connection findTransactionByDescription: t ]