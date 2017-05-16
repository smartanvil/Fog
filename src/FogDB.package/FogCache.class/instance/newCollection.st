instance creation
newCollection
	^ self caching
		ifTrue: [ OrderedCollection  new ]
		ifFalse: [ FogFakeSet new ]