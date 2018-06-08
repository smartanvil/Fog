*FogDB
acceptVisitor: aVisitor 
	^ self collect: [ : n | n acceptVisitor: aVisitor ]