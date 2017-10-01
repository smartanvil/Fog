*FogEQL
all
	^ self size > 0
		ifTrue: [ 1 to: self size ]
		ifFalse: [ OrderedCollection new ]