accessing
caching
	^ caching ifNil: [ caching := parent ifNil: [ self class defaultIsCaching ] ifNotNil: [ parent caching ] ]