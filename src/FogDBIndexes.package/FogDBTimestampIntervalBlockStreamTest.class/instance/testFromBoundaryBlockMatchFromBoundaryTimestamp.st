initialization
testFromBoundaryBlockMatchFromBoundaryTimestamp
	stream fromStamp >= (self fetchBlock: stream fromBlockNumber ) timestamp.
	stream fromStamp < (self fetchBlock: stream fromBlockNumber - 1 ) timestamp.