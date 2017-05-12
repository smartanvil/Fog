as yet unclassified
loadCode: aFileReference connection: aConnection
	| compiled |
	compiled := aConnection compileSolidity: aFileReference.
	compiled fromFile: aFileReference.
	^ compiled