building methods
buildNodes: aCollectionOfDictNodes
	^ aCollectionOfDictNodes collect: [ :dn | self buildNode: dn ]