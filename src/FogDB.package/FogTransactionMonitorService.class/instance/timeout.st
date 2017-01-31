stepping
timeout
	^ monitors isEmpty
		ifTrue: [ 10 seconds ]
		ifFalse: [ 1 second ]