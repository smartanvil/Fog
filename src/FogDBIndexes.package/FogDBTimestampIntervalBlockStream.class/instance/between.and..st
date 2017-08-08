boundaries accessing
between: aStamp and: otherStamp
	fromStamp := aStamp.
	toStamp := otherStamp.
	fromBlockNumber := self binarySearchFindClosestTo: fromStamp .
	toBlockNumber := self binarySearchFindClosestTo: toStamp .
	currentBlockNumber := fromBlockNumber