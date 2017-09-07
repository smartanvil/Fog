as yet unclassified
visitMemberAccess: anEQLMemberAccessNode
	| property accesses |
	property := anEQLMemberAccessNode property acceptVisitor: self.
	accesses := anEQLMemberAccessNode members collect: [ :m | m acceptVisitor: self ].
	^ FogEQLNameAccess new
		value: property;
		accesses: accesses;
		yourself