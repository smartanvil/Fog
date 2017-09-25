as yet unclassified
getBufferNamed: aName
	^ [(aName fetchValueFromNestedDictionary: namedbuffers)]
		on: KeyNotFound
		do: [ :e | Error signal: ' Buffer  ' , aName printString , ' does not exist ' ]