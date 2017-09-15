as yet unclassified
next
	| ret |
	[ ret := super next ]
		doWhileFalse: [ ret ifNil: [ ^ nil ].
			(ret allSatisfy: [ :f | f value isNotNil ])
				ifFalse: [ ^ ret ].
			filter individualResultMatches: ret ].
	^ ret