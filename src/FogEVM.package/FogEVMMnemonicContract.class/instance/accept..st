converting
accept: anInterpreter
	^ sequence do: [ :e | e accept: anInterpreter with: sequence ]