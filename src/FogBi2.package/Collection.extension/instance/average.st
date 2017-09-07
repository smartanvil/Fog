*FogBi2
average
	^ self size = 0
		ifTrue: [ 0 ]
		ifFalse: [ self sum / self size ]