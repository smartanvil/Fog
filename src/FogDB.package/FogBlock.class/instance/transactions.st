accessing
transactions
	^ transactions ifNil: [ transactions := self privateInflateTransactions ]