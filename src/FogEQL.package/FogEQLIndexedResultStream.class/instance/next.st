as yet unclassified
next
	| i ret |
	[ i := index next.
	index atEnd
		ifTrue: [ ^ nil ].
	ret := source collect: [ :s | s key -> (s value at: i) ] ]
		doWhileFalse: [ (ret allSatisfy: [ :f | f value isNotNil ]) and: [ filter individualResultMatches: ret ] ].
	^ ret