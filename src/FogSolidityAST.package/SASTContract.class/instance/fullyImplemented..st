as yet unclassified
fullyImplemented: aBoolean
	self assert: aBoolean.
	fullyImplemented := aBoolean.
	self flag: #whatMeansPartialImplementation.