tests
testSetTwoStringEnumInt
	| future setString |
	"string value1, EnumDefinition valEnum, int256 valInt, string value2 "
	setString := mirror method: #setTwoStringsEnumInt:and:and:and:.
	future := session 
		receiptFor:
			(setString
				using: session
				applyOn: contract
				valueWithArguments: {'HeyTwoStrings!' . #NEUTRAL . 123 . 'Yeahyou'}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60).
	future synchronizeTimeout: 10 minutes.
	self
		assert:
			((mirror method: #getString)
				using: session
				applyOn: contract
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60)
		equals: 'HeyTwoStrings!'.
	self
		assert:
			((mirror method: #getEnum)
				using: session
				applyOn: contract
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60)
		equals: #NEUTRAL.
	self
		assert:
			((mirror method: #getPositiveInt)
				using: session
				applyOn: contract
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60)
		equals: 123