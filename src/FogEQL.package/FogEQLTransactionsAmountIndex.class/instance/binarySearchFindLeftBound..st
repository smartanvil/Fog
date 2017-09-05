as yet unclassified
binarySearchFindLeftBound: anInteger
	| analysing next lower upper current |
	lower := 1.
	upper := self data size.
	[ lower < upper ]
		whileTrue: [ current := lower + ((upper - lower) // 2).
			analysing := self data at: current.
			next := self data at: current + 1.
			((analysing at: 1) < anInteger and: [ anInteger <= (next at: 1) ])
				ifTrue: [ ^ current + 1 ].
			anInteger > (analysing at: 1)
				ifTrue: [ lower = current
						ifTrue: [ ^ current ].
					lower := current ]
				ifFalse: [ upper := current ] ].
	self assert: current = 1.
	^ current