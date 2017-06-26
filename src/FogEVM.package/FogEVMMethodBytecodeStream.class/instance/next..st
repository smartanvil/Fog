accessing
next: anInteger
	| cont |
	cont := OrderedCollection new.
	anInteger timesRepeat: [ cont add: self next ].
	^ cont