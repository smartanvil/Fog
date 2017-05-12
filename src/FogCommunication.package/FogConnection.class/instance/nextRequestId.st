rpc call
nextRequestId
	| nextId |
	nextId := requestId.
	requestId := requestId + 1.
	^ nextId