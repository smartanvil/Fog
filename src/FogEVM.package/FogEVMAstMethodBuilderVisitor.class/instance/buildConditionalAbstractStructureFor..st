visiting
buildConditionalAbstractStructureFor: aConditionalJump
	| visitor conditionalStructure |
	
	visitedStatements add: aConditionalJump.
	visitor := FogEVMAstScopeBuilderVisitor new
		selector: aConditionalJump address literalValue;
		visited: visitedStatements ;
		installSequence: sequence; 
		fromNode: (self statementFor: aConditionalJump);
		setNextStatement: (self statementFor: aConditionalJump);
		toNode: toNode;
		yourself.
	
	visitor extractFromInstalledSequence.
	conditionalStructure := FogEVMAstAbstractConditionalStructure new.
	conditionalStructure condition: aConditionalJump condition.
	conditionalStructure body: visitor method.
	
	^ conditionalStructure