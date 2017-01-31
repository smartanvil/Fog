public
startOn: aDictionartyNode
	| node locator sf linker |
	sf := self suicideFunction.
	types install: sf.
	node := self buildNode: aDictionartyNode.
	self reduceAllPostExecutions.
	linker := SASTLocateIdentifiers new.
	linker suicideFunction: sf.
	locator := node accept: linker.
	self assert: node isSourceUnit. 
	node types: types. 
	^ node