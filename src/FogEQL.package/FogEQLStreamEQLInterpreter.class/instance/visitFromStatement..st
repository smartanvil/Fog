as yet unclassified
visitFromStatement: anEQLFromStatementNode
	^ (anEQLFromStatementNode sources acceptVisitor: self)