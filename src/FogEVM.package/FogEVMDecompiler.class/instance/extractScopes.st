as yet unclassified
extractScopes
	| scoper newScopes |
	scoper := FogEVMAstScoperVisitor new.
	scoper scope: currentScope.
	newScopes := scoper scopes