as yet unclassified
individualResultMatches: aData
	| leftValue rightValue |
	leftValue := left isFogName
		ifTrue: [ left fetchValue: aData ]
		ifFalse: [ left ].
	rightValue := right isFogName
		ifTrue: [ right fetchValue: aData ]
		ifFalse: [ right ].
	^ leftValue perform: self operation withArguments: {rightValue}