visiting
visitCalldataload: aFogVMCalldataload
	| id |
	id := stack pop asBKNumber.
	stack push: (self accessCallFrom0BaseIndex: id)