boundaries accessing
between: aStamp and: otherStamp
	fromStamp := aStamp.
	toStamp := otherStamp.
	fromBlockNumber := FogDBBinarySearch binarySearchFindClosestTo: fromStamp.
	toBlockNumber := FogDBBinarySearch binarySearchFindClosestTo: toStamp.
	currentBlockNumber := fromBlockNumber