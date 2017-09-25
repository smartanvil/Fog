visiting
visitSelectStatement: anEQLSelectStatementNode
	| domain |
	domain := anEQLSelectStatementNode domain
		ifNil: [ FogEQLDynamicGlobals value ]
		ifNotNil: [ anEQLSelectStatementNode domain acceptVisitor: self ].
		self halt. 
	^ FogEQLSelect new
		from: (anEQLSelectStatementNode from acceptVisitor: self);
		domain: domain;
		where: (anEQLSelectStatementNode where acceptVisitor: self);
		orderBy: (anEQLSelectStatementNode orderBy acceptVisitor: self);
		limit: (anEQLSelectStatementNode limit acceptVisitor: self);
		select: (anEQLSelectStatementNode binding acceptVisitor: self);
		yourself