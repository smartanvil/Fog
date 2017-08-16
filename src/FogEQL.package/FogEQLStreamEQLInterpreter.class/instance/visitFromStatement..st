as yet unclassified
visitFromStatement: anEQLFromStatementNode
	^ FogEQLNamedStreamSelector new
		binding: anEQLFromStatementNode binding value asSymbol;
		streamName: anEQLFromStatementNode stream_name value asSymbol;
		yourself