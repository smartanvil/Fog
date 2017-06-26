converting
accept: anInterpreter
	^ content do: [ :e | e accept: anInterpreter with: content ]