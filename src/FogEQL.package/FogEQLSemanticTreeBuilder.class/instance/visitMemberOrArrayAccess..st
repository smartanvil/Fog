as yet unclassified
visitMemberOrArrayAccess: anEQLMemberOrArrayAccessNode 
	| property accesses |
	self assert: anEQLMemberOrArrayAccessNode access_expressions isEmpty.
	property := anEQLMemberOrArrayAccessNode property acceptVisitor: self.
	accesses := anEQLMemberOrArrayAccessNode members collect: [ :m | m acceptVisitor: self ].
	^ FogEQLNameAccess new
		value: property;
		accesses: accesses;
		yourself