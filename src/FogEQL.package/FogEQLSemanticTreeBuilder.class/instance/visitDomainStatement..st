visiting
visitDomainStatement: anEQLDomainStatementNode
	^ (FogEQLFogConnection on: 'http://' , anEQLDomainStatementNode url value) environment