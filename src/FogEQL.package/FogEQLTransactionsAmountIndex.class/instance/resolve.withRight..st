as yet unclassified
resolve: anOperation withRight: anInteger
	^ self perform: anOperation with: (self binarySearchValueInterval: anInteger)