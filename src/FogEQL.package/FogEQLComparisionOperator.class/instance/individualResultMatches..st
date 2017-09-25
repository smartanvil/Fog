as yet unclassified
individualResultMatches: aData
	| leftValue rightValue |
	leftValue := left fetchValueFromDictionary: aData.
	rightValue := right fetchValueFromDictionary: aData.
	^ [ leftValue perform: self operation withArguments: {rightValue} ]
		on: MessageNotUnderstood
		do: [ :e | FogEQLError invalidOperation: self operation over: leftValue with: rightValue ]