initialization
testUpdateCurrentBlockNumberShiftsCurrentUp
	| previous |
	previous := stream currentBlockNumber.
	stream updateCurrentBlockNumber.
	self assert: previous < stream currentBlockNumber.