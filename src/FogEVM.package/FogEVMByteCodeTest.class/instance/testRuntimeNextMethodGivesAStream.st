initialization
testRuntimeNextMethodGivesAStream
	| stream |
	stream := contractDescription mnemonicRuntime readStream.
	stream nextMethodLookup.
	self assert: (stream nextMethod isKindOf: FogEVMMethodBytecodeStream)