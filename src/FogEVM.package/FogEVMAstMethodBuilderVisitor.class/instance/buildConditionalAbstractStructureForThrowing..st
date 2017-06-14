as yet unclassified
buildConditionalAbstractStructureForThrowing: aFogEVMAstConditionalJump
	| throw conditionalStructure |
	throw := FogEVMAstMethod new.
	throw sequence addStatement: FogEVMAstThrow new.
	conditionalStructure := FogEVMAstAbstractConditionalStructure new.
	conditionalStructure condition: aFogEVMAstConditionalJump condition.
	conditionalStructure body: throw.
	^ conditionalStructure