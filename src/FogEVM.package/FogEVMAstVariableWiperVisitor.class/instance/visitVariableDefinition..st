visiting
visitVariableDefinition: aFogEVMAstVariable
	self readWriteTracker
		at: aFogEVMAstVariable
		ifPresent: [ :d | (d at: #scopes) add: currentScope ]
		ifAbsentPut: [ {(#scopes -> {currentScope} asSet).
			(#read -> 0).
			(#write -> 0)} asDictionary ]