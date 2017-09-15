as yet unclassified
next
	| ret |
	[ ret := super next ]
		doWhileFalse: [ ret ifNil: [ ^ nil ].
			(ret allSatisfy: [ :f | f value isNotNil ]) and: [ filter individualResultMatches: ret ] ].
	^ ret