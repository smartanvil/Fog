as yet unclassified
newWith: aCollection
	^ aCollection
		ifEmpty: [ self constructor ]
		ifNotEmpty: [ self constructor: aCollection ]