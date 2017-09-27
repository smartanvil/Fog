as yet unclassified
selectFrom: aFunctionsObject
	| selector |
	selector := (aFunctionsObject respondsTo: self asSymbol)
		ifTrue: [ self asSymbol ]
		ifFalse: [ | pragma |
			pragma := Pragma allNamed: self asSymbol from: aFunctionsObject class to: Object.
			[ self assert: pragma size = 1 ]
				on: Error
				do: [ FogEQLError signal: aFunctionsObject printString, ' Not implemented method / function ' , self asSymbol ].
			pragma first method selector ].
	^ MessageSend receiver: aFunctionsObject selector: selector