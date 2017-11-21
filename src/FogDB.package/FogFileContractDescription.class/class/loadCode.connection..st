as yet unclassified
loadCode: aFileReference connection: aConnection
	| compiled ref |
	ref := aFileReference exists
		ifFalse: [ aFileReference parent / (((('.' split: aFileReference basename) at: 1) copyFrom: 1 to: (('.' split: aFileReference basename) at: 1) size - 1) , '.sol') ]
		ifTrue: [ aFileReference ].
	compiled := aConnection compileSolidity: ref.
	compiled fromFile: ref.
	^ compiled