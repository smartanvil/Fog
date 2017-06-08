printing
value: aValue
	(self isConstant and: [ value isNotNil and: [ value ~= aValue ] ])
		ifTrue: [ self error: ' Constant cannot be assigned twice. ' ]
		ifFalse: [ value := aValue ]