as yet unclassified
detect: aBlock ifNoneCreate: aBlockInitialized
	^ self instances
		detect: aBlock
		ifNone: [ | i |
			i := self cachedNew.
			aBlockInitialized value: i.
			i  ]