as yet unclassified
resolve: aBinaryComparition forLeft: aDataAccessor withRight: aConstantValue

	^ (self hasIndexFor: aDataAccessor)
		ifTrue: [ (self indexOn: aDataAccessor) resolve: aBinaryComparition withRight: aConstantValue ]
		ifFalse: [ #all ]