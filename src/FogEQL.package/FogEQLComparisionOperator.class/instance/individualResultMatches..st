as yet unclassified
individualResultMatches: aData
	| leftValue rightValue |
	leftValue := left isFogName
		ifTrue: [ left fetchValueFromDictionary: aData ]
		ifFalse: [ left ].
	rightValue := right isFogName
		ifTrue: [ right fetchValueFromDictionary: aData ]
		ifFalse: [ right ].
	^ [ leftValue perform: self operation withArguments: {rightValue} ]
		on: MessageNotUnderstood
		do: [ :e | FogEQLError invalidOperation: self operation over: leftValue with: rightValue  ]