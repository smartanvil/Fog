as yet unclassified
extractScopes
	| scoper newScopes |
	scoper := FogEVMAstScoper new.
	scoper scope: currentScope.
	extractedMethods := scoper methods 