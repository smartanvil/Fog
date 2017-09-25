as yet unclassified
fetchValueFromDictionary: aCollection
	| argumentsToUse |
	^ self needsBinding
		ifTrue: [ argumentsToUse := arguments
				collect: [ :a | 
					(a isFogName or: [ a isFogFunction ])
						ifTrue: [ a fetchValueFromDictionary: aCollection ]
						ifFalse: [ a ] ].
			self reduceUsing: argumentsToUse and: FogEQLDynamicGlobals value ]
		ifFalse: [ self reduce ]