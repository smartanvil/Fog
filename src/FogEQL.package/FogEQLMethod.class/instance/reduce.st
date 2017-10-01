truncation and round off
reduce
	| args |
	args := arguments
		collect: [ :a | 
			a isEQLMethod
				ifTrue: [ a reduce ]
				ifFalse: [ a ] ].
	^ self reduceUsing: args and: self receiver 