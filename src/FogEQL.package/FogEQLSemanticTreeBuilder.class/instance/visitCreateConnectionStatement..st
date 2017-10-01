as yet unclassified
visitCreateConnectionStatement: anEQLCreateConnectionStatementNode
	^ FogEQLCreateConnection
		connection:
			(FogEQLConnection new
				name: (anEQLCreateConnectionStatementNode name acceptVisitor: self);
				url: (anEQLCreateConnectionStatementNode url acceptVisitor: self);
				yourself)