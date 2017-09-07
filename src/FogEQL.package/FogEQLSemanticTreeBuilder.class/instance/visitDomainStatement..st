visiting
visitDomainStatement: anEQLDomainStatementNode
	^ (FogEQLConnection on: 'http://' , anEQLDomainStatementNode url value) environment