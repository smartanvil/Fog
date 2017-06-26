initialization
testBinaryPollHas6Methods
	| stream |
	stream := contractDescription mnemonicBinary readStream.
	stream nextConstructor. 
	stream nextMethodLookup.
	6 timesRepeat: [ stream nextMethod ].
	self should: [ stream nextMethod ] raise: Error