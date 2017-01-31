private
privateInflateTransactions
	^ transactionsHashes collect: [ :t | self connection eth inflateTransaction: t ]