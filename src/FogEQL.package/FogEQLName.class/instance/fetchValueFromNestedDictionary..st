as yet unclassified
fetchValueFromNestedDictionary: aDataObject
	| dic |
	dic := aDataObject asDictionary.
	^ dic at: value value