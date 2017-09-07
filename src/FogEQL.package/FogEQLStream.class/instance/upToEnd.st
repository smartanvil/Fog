accessing
upToEnd
	| content |
	content := OrderedCollection new.
	[ self hasNext ] whileTrue: [ content add: self next ].
	^ content