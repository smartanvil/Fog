as yet unclassified
index: aString
	| pieces |
	pieces := ' ' split: aString.
	pieces size = 1
		ifTrue: [ ^ aString ].
	^ ' ' join: (pieces first: 2)