as yet unclassified
matches: aString
	(aString indexOfSubCollection: 'function') = 0
		ifTrue: [ ^ false ].
	^ (self name copyReplaceAll: ' ' with: '')
		=
			(((aString copyReplaceAll: 'memory' with: '') copyReplaceAll: 'storage ref' with: '')
				copyReplaceAll: ' '
				with: '')