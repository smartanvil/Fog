*Fog
minus: aString
	| index to |
	to := aString size min: self size.
	index := 1.
	[ (self at: index) = (aString at: index )] whileTrue: [ index := index + 1 ].
	^ self copyFrom: index to: self size.