stream
next: anAmountOfBlocks
	^ (self canFetchNextAmount: anAmountOfBlocks)
		ifFalse: [ SubscriptOutOfBounds signal ]
		ifTrue: [ (1 to: anAmountOfBlocks) collect: [ :i | self next ] ]