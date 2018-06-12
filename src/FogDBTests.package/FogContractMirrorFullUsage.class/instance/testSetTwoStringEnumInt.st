tests
testSetTwoStringEnumInt
	| future setString |
	"string value1, EnumDefinition valEnum, int256 valInt, string value2 "
	setString := mirror method: #setTwoStringsEnumInt:and:and:and:.
	future := FogTransactionMonitorService current
		receiptFor:
			(setString
				applyOn: contract
				valueWithArguments: {'HeyTwoStrings!' . #NEUTRAL . 123 . 'Yeahyou'}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60).
	future synchronizeTimeout: 10 minutes.
	self
		assert:
			((mirror method: #getString)
				applyOn: contract
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60)
		equals: 'HeyTwoStrings!'.
	self
		assert:
			((mirror method: #getEnum)
				applyOn: contract
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60)
		equals: #NEUTRAL.
	self
		assert:
			((mirror method: #getPositiveInt)
				applyOn: contract
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60)
		equals: 123