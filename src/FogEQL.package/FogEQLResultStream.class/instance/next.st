as yet unclassified
next 
	self atEnd
		ifTrue: [ ^ nil ].
	^ self nextIndex with: source collect: [ :idx :src | src key -> (src value at: idx) ]