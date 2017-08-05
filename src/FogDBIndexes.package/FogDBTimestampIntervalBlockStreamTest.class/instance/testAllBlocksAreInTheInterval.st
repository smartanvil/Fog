initialization
testAllBlocksAreInTheInterval
	stream content allSatisfy: [ :b | b timestamp between: fromStamp and: toStamp ].
	stream toStamp <= (self fetchBlock: stream toBlockNumber) timestamp.
	stream toStamp > (self fetchBlock: stream toBlockNumber + 1) timestamp