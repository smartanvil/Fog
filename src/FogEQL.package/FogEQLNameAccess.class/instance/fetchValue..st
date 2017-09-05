as yet unclassified
fetchValue: aCollectionOfAssociations
	| dic |
	dic := aCollectionOfAssociations asDictionary.
	^ accesses inject: (dic at: value value) into: [ :acc :name | name fetchValue: acc ]