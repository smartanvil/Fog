as yet unclassified
newCollection
	^ self caching
		ifTrue: [ Set new ]
		ifFalse: [ FogFakeSet new ]