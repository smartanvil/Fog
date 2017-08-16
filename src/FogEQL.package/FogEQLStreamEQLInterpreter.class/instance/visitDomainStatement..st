as yet unclassified
visitDomainStatement: anEQLDomainStatementNode
	^ FogCachedConnection on: 'http://' , anEQLDomainStatementNode url value