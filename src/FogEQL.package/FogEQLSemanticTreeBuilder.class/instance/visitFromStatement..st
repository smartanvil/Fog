visiting
visitFromStatement: anEQLFromStatementNode
	^ FogEQLFrom new
		datasources: (anEQLFromStatementNode sources acceptVisitor: self);
		yourself