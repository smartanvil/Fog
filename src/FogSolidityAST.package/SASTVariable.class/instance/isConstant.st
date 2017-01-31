testing
isConstant
	self flag: #uhm.
	^ initialValue isNotNil and: [ maybeConstant ]