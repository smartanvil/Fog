visiting
visitFromStatement: anEQLFromStatementNode
	^ FogEQLFrom new
		mainsrc: (anEQLFromStatementNode base_source acceptVisitor: self);
		joined: (anEQLFromStatementNode sourceses collect: [ : s | s acceptVisitor: self]);
		yourself