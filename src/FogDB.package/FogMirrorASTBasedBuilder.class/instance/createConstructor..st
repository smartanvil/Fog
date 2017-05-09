as yet unclassified
createConstructor: aSASTFunction
	self assert: aSASTFunction parameters size = 0.
	^ FogConstructorMirror new
		name: #constructor;
		parameters: aSASTFunction parameters;
		yourself