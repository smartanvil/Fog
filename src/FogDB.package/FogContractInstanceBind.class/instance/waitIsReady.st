as yet unclassified
waitIsReady
	self isReady ifFalse: [ address synchronizeTimeout: 5 minutes  ]