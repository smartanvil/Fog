as yet unclassified
binarySearchValueInterval: anInteger
	| left right |
	left := self binarySearchFindLeftBound: anInteger.
	right := self binarySearchFindRightBound: anInteger withLeftAt: left.
	^ left @ right.