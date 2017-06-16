visiting
buildConditionalAbstractStructureFor: aConditionalJump
	| visitor conditionalStructure |
	
	visitedStatements add: aConditionalJump.
	visitor := FogEVMAstScopeBuilderVisitor new
		selector: aConditionalJump address literalValue;
		visited: visitedStatements ;
		fromNode: (self statementFor: aConditionalJump);
		installSequence: sequence; 
		toNode: toNode;
		yourself.
	
	visitor extractFromInstalledSequence.
	conditionalStructure := FogEVMAstAbstractConditionalStructure new.
	conditionalStructure condition: aConditionalJump condition.
	conditionalStructure body: visitor method.
	
	^ conditionalStructure