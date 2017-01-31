as yet unclassified
printOn: aStream
	('TransferEntity id: {1} version: {2} '
		format:
			{id.
			jsonrpc}) printOn: aStream.
	aStream cr.
	^ message printOn: aStream