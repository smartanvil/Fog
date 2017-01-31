as yet unclassified
fetchValueForIdentifier: aSASTIdentifier
	^ block variables , parameters variables , return variables detect: [ :p | p name = aSASTIdentifier value ]