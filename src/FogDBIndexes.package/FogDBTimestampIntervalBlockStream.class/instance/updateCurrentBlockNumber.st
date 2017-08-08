private
updateCurrentBlockNumber
	^ currentBlockNumber < toBlockNumber
		ifTrue: [ currentBlockNumber := currentBlockNumber + 1 ]
		ifFalse: [ SubscriptOutOfBounds signal ]