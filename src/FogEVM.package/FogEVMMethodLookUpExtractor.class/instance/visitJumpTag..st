visiting
visitJumpTag: aFogEVMAstJumpTag
	currentMethodAnalysis := lookUpTable associations
		detect: [ :a | (a value at: #address) literalValue asBKNumber = aFogEVMAstJumpTag address ]
		ifFound: [ :a | 
			a value at: #startNode put: aFogEVMAstJumpTag.
			a key ]
		ifNone: [ currentMethodAnalysis ]