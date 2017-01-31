as yet unclassified
hasValueForIdentifier: aSASTIdentifier
	^ ((variables anySatisfy: [ :p | p name = aSASTIdentifier value ]) or: [ events anySatisfy: [ :ev | ev name = aSASTIdentifier value and: [ ev type = aSASTIdentifier type ] ] ])
		or: [ functions anySatisfy: [ :ev | ev name = aSASTIdentifier value and: [ ev type = aSASTIdentifier type ] ] ]