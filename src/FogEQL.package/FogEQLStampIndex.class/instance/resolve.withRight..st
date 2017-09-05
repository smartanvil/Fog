private
resolve: anOperation withRight: aDateAndTime
	^ self perform: anOperation with: (self binarySearchFindClosestTo: aDateAndTime)