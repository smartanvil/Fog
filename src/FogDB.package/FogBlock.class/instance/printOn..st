printing
printOn: aStream
	^ ('Block- {1} - {2} transaction(s) '
		format:
			{self number asString.
			transactionsHashes size asString}) printOn: aStream