testing
hasValueForIdentifier: aSASTIdentifier
	^ (block variables anySatisfy: [ :p | p name = aSASTIdentifier value ]) 
	or: ((parameters variables anySatisfy: [ :p | p name = aSASTIdentifier value ]) 
	or: [ return variables anySatisfy: [ :p | p name = aSASTIdentifier value ] ])