visiting
visitSelectStatement: anEQLSelectStatementNode
	| from domain rslt |
	from := anEQLSelectStatementNode from acceptVisitor: self.
	domain := anEQLSelectStatementNode domain
		ifNotNil: [ anEQLSelectStatementNode domain acceptVisitor: self ]
		ifNil: [ FogConnection currentConnection ].
	rslt := FogEQLNamedDatasourceProxy new
		selector: from;
		connection: domain asConnection;
		yourself.
	rslt := anEQLSelectStatementNode where
		ifNil: [ rslt ]
		ifNotNil: [ FogEQLFilteredStream new
				source: rslt;
				filter: (anEQLSelectStatementNode where acceptVisitor: self);
				yourself ].
	rslt := anEQLSelectStatementNode orderBy
		ifNil: [ rslt ]
		ifNotNil: [ FogEQLSortedStream new
				source: rslt;
				sortBy: (anEQLSelectStatementNode orderBy acceptVisitor: self);
				yourself ].
	rslt := anEQLSelectStatementNode limit
		ifNil: [ rslt ]
		ifNotNil: [ FogEQLLimitedStream new
				source: rslt;
				limit: (anEQLSelectStatementNode limit acceptVisitor: self) yourself ].
			 
	^ FogEQLProjectionStream new
		source: rslt;
		outline: (anEQLSelectStatementNode binding acceptVisitor: self);
		yourself