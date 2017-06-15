as yet unclassified
declareMethods
	decompiledMethods := lookUpTable associations
		collect: [ :a | 
			| visitor |
			visitor := FogEVMAstMethodBuilderVisitor new
				selector: a key literalValue;
				fromNode: (a value at: #startNode);
				toNode: (a value at: #endNode);
				yourself.
			visitor extractFrom: workingOn.
			FogEVMAstUneededJumpsWiper new wipeJumpsFrom: visitor method.
			visitor method ]