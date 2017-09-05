as yet unclassified
gatherBlockNumbersForDatasource: aFogStreamsContractInstancesBuffer
	| leftValue rightValue |
	leftValue := self resolve: left for: aFogStreamsContractInstancesBuffer.
	rightValue := self resolve: right for: aFogStreamsContractInstancesBuffer.
	(leftValue isDatasource and: [ rightValue isDatasource not ])
		ifTrue: [ ^ leftValue resolve: self operationSymbol forLeft: left withRight: rightValue ].
	(leftValue isDatasource not and: [ rightValue isDatasource ])
		ifTrue: [ ^ rightValue resolve: self operation withLeft: leftValue forRight: right ].
	^ leftValue mergeBy: self operation withRight: rightValue