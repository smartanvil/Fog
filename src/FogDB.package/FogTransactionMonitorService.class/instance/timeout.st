stepping
timeout
	^ monitors isEmpty
		ifTrue: [ 1 seconds ]
		ifFalse: [ 1 second ]