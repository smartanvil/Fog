as yet unclassified
valueWithDictionaryArguments: aCollection
	| argumentsToUse |
	^ self needsBinding
		ifTrue: [ argumentsToUse := arguments
				collect: [ :a | 
					(a isFogName or: [ a isEQLMethod ])
						ifTrue: [ a valueWithDictionaryArguments: aCollection ]
						ifFalse: [ a ] ].
			self reduceUsing: argumentsToUse and: (self receiverFor: aCollection) ]
		ifFalse: [ self reduce ]