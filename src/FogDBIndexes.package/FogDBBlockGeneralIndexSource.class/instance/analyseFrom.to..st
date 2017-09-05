source-gathering
analyseFrom: aStamp to: otherStamp
	from := FogDBBinarySearch binarySearchFindClosestTo: aStamp.
	to := FogDBBinarySearch binarySearchFindClosestTo: otherStamp.
	self initializeFrom: from to: to. 
	self analyse. 
	