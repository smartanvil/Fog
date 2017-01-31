as yet unclassified
printOn: aStream
	^ ('Block- {1} Created {2} ago {3} transaction(s) '
		format:
			{self number asString.
			(DateAndTime now - self timestamp) asString.
			transactionsHashes size asString}) printOn: aStream