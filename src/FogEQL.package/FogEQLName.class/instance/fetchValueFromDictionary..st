as yet unclassified
fetchValueFromDictionary: aDataObject
	| dic |
	dic := aDataObject asDictionary.
	^ dic at: value value