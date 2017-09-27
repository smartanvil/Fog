as yet unclassified
fetchValueFromNestedDictionary: aCollectionOfAssociations
	| dic |
	dic := aCollectionOfAssociations asDictionary.
	^ accesses inject: (dic at: value string) into: [ :acc :name | name fetchValueFromNestedDictionary: acc ]