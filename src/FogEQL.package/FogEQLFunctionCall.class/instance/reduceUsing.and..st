as yet unclassified
reduceUsing: aCollectionOfArgs and: aFogEQLEnvironment
	^ (selector selectFrom: aFogEQLEnvironment functions) valueWithArguments: aCollectionOfArgs