as yet unclassified
fetchValueForIdentifier: aSASTIdentifier
	^ variables
		detect: [ :p | p name = aSASTIdentifier value ]
		ifNone: [ events
				detect:
					[ :ev | ev name = aSASTIdentifier value and: [ ev type = aSASTIdentifier type ] ]
				ifNone: [ functions
						detect:
							[ :ev | ev name = aSASTIdentifier value and: [ ev type = aSASTIdentifier type ] ] ] ]