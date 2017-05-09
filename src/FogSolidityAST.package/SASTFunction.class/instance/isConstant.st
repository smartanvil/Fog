as yet unclassified
isConstant
	self flag: #CheckThis.
	"self assert: (constant and: [ block hasAssignations not ]) = constant."
	^ constant