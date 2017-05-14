tests
testSetTwoStringEnumInt
	| future setString |
	"string value1, EnumDefinition valEnum, int256 valInt, string value2 "
	setString := mirror method: #setTwoStringsEnumInt:and:and:and:.
	future := FogTransactionMonitorService current
		receiptFor: (setString applyOn: contract valueWithArguments: {'Hey!' . #NEUTRAL . -123 . 'Yeahyou'} sender: self ownerAccount).
	future synchronizeTimeout: 10 minutes.
	self assert: ((mirror method: #getString) applyOn: contract valueWithArguments: {} sender: self ownerAccount) equals: 'Hey!'.
	self assert: ((mirror method: #getEnum) applyOn: contract valueWithArguments: {} sender: self ownerAccount) equals: #NEUTRAL.
	self assert: ((mirror method: #getPositiveInt) applyOn: contract valueWithArguments: {} sender: self ownerAccount) equals: -123