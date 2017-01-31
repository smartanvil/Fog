as yet unclassified
reduceAllPostExecutions: aCollectionOfReductions
	| error success |
	success := OrderedCollection new.
	error := OrderedCollection new.
	aCollectionOfReductions
		do: [ :b | 
			[ | red |
			red := b value.
			success add: b ]
				on: Error
				do: [ :err | 
					error add: b.
					(err isKindOf: SASTChainForceDeferredTypeResolution)
						ifFalse: [ err signal ] ] ].
	error isEmpty
		ifFalse: [ success isEmpty
				ifTrue: [ self error: 'No successes!' ]
				ifFalse: [ self reduceAllPostExecutions: error ] ]