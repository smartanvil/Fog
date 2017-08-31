accessing
binarySearchFindRightBound: anInteger withLeftAt: left
	| analysing next lower upper current |
	lower := left.
	upper := self data size.
	[ lower < upper ]
		whileTrue: [ current := lower + ((upper - lower) // 2).
			analysing := (self data at: current) at: 1.
			next := (self data at: current + 1) at: 1.
			(analysing <= anInteger and: [ anInteger < next ])
				ifTrue: [ ^ current ].
			anInteger >= analysing
				ifTrue: [ lower = current
						ifTrue: [ ^ current ].
					lower := current ]
				ifFalse: [ upper := current ] ].
	self halt