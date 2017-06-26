initialization
testBinaryNextMethodGivesAStream
	| stream |
	stream := contractDescription mnemonicBinary readStream.
	stream nextConstructor.
	stream nextMethodLookup.
	self assert: (stream nextMethod isKindOf: FogEVMMethodBytecodeStream).
	