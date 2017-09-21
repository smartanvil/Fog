as yet unclassified
asSortedCollection
	^ sortedCollection ifNil: [ sortedCollection := ((OrderedCollection withAll: self) reject: [ :b | b isNil ]) sort ]