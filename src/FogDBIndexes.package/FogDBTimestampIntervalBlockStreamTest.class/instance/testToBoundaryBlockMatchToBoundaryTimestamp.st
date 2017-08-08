initialization
testToBoundaryBlockMatchToBoundaryTimestamp
	stream toStamp <= (self fetchBlock: stream toBlockNumber) timestamp.
	stream toStamp > (self fetchBlock: stream toBlockNumber +1) timestamp