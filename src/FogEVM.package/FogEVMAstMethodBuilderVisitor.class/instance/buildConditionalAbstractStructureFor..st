visiting
buildConditionalAbstractStructureFor: aConditionalJump
	| visitor conditionalStructure |
	
	visitor := FogEVMAstMethodBuilderVisitor new
		selector: aConditionalJump address literalValue;
"		visited: visitedStatements;"
		installSequence: sequence; 
		fromNode: (self statementFor: aConditionalJump);
		setNextStatement: (self statementFor: aConditionalJump);
		toNode: toNode;
		yourself.
	visitedStatements add: aConditionalJump.
	visitor extractFromInstalledSequence.
	conditionalStructure := FogEVMAstAbstractConditionalStructure new.
	conditionalStructure condition: aConditionalJump condition.
	conditionalStructure body: visitor method.
	
	^ conditionalStructure