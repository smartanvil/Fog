as yet unclassified
isConstant
	self assert: (constant and: [ block hasAssignations not ]) = constant.
	^ constant