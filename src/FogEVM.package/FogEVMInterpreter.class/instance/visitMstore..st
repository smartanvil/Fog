visiting
visitMstore: aFogVMMstore 
	| address value |
	address := stack pop.
	value := stack pop.
	self memory store: value at: address