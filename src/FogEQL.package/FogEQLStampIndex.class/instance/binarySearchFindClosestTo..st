private
binarySearchFindClosestTo: aStamp
	| analysing lower upper current stamp |
	[ stamp := aStamp asUnixTime ]
		on: MessageNotUnderstood
		do: [ :e | FogEQLError notValidTimeStamp: aStamp ].
	analysing := self data size.
	lower := 2.
	upper := analysing.
	[ lower < upper ]
		whileTrue: [ current := lower + ((upper - lower) // 2).
			analysing := current - 1.
			self assert: ((self data at: analysing) at: 1) <= ((self data at: current) at: 1).
			(((self data at: analysing) at: 1) <= stamp and: [ stamp <= (self data at: current) at: 1 ])
				ifTrue: [ ^ current ].
			stamp > ((self data at: current) at: 1)
				ifTrue: [ lower = current
						ifTrue: [ ^ current ].
					lower := current ]
				ifFalse: [ upper := current ] ].
	self error: 'No value found'