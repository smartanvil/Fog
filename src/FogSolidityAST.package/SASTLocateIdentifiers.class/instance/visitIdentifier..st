as yet unclassified
visitIdentifier: aSASTIdentifier
	| context |
	(aSASTIdentifier type matches: aSASTIdentifier value) ifTrue:[ 
		aSASTIdentifier referencesTo: aSASTIdentifier type.
		^ self 
	]. 
	aSASTIdentifier value = 'suicide'
		ifTrue: [ aSASTIdentifier referencesTo: self suicideFunction ]
		ifFalse: [ context := contexts
				detect: [ :c | c hasValueForIdentifier: aSASTIdentifier ]
				ifNone: [ self error: 'Identifier not found in any context' ].
			aSASTIdentifier referencesTo: (context fetchValueForIdentifier: aSASTIdentifier) ]