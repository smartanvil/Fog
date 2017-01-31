values
testSimpleExampleIsWellSetUp
	| struct |
	"	simpleExample.boolean = true; 
	simpleExample.uservalue = myenum.B;
	simpleExample.commonvalue = 6355432;"
	struct := (mirror property: #simpleExample) value: contract.
	self assert: (struct at: #boolean) equals: true.
	self assert: (struct at: #uservalue) equals: 'B'.
	self assert: (struct at: #commonvalue) equals: 6355432