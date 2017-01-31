as yet unclassified
nextRequestId
	| nextId |
	nextId := requestId.
	requestId := requestId + 1.
	^ nextId