accessing
at: anInteger
	| id |
	id := (anInteger between: 1 and: self size)
		ifTrue: [ from + (step * (anInteger - 1)) ]
		ifFalse: [ self errorSubscriptBounds: anInteger ].
	^ index at: id