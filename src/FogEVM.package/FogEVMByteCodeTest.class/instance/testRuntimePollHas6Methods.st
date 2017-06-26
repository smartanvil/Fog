initialization
testRuntimePollHas6Methods
	| stream |
	stream := contractDescription mnemonicRuntime readStream.
	stream nextMethodLookup.
	6 timesRepeat: [ stream nextMethod ].
	self should: [ stream nextMethod ] raise: Error