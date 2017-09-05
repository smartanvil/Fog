as yet unclassified
next: anInteger
	| aCollection |
	aCollection := OrderedCollection new.
	anInteger timesRepeat: [ aCollection addLast: self next ].
	^ aCollection