printing
valueWithDictionaryArguments: aData
	| leftValue rightValue |
	leftValue := left valueWithDictionaryArguments: aData.
	rightValue := right valueWithDictionaryArguments: aData.
	^ [ leftValue perform: self operation withArguments: {rightValue} ]
		on: MessageNotUnderstood
		do: [ :e | FogEQLError invalidOperation: self operation over: leftValue with: rightValue ]