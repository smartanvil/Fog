visiting
visitRootQuery: anEQLRootQueryNode
	^ anEQLRootQueryNode clauses collect: [ :c | c acceptVisitor: self ]