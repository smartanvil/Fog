building methods
compilableInstanceMethodsWithAmounts
	^ description mirror instanceMirror methods collect: [ :m | self compilableMethodAmount: m ]