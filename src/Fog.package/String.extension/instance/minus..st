*Fog
minus: aString
	| index to |
	^ aString
		ifNil: [ '' ]
		ifNotNil: [ to := aString size min: self size.
			index := 1.
			[ (self at: index) = (aString at: index) ] whileTrue: [ index := index + 1 ].
			self copyFrom: index to: self size ]