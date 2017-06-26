as yet unclassified
nextMethod
	| content boundaries |
	content := self next: 4.
	boundaries := self privateMethodBoundaries.
	self
		assert: (content collect: #instruction) asArray = boundaries
		description: ' Out of method!  '.
	content := content , (self upToCondition: [: b | b instruction isFinishStatus  ]).
	^ FogEVMMethodBytecodeStream on: content projectedFrom: collection