tests
testContractHasTypes
	| typeNames |
	typeNames := simpleStorage contract mirror types values collect: #name.
	self assert: (typeNames includes: #address).
	self assert: (typeNames includes: #bool).
	self assert: (typeNames includes: #uint).