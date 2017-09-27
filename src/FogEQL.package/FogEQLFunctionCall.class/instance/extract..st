as yet unclassified
extract: aCollection
	| argumentsToUse |
	^ self needsBinding
		ifTrue: [ argumentsToUse := arguments
				collect: [ :a | 
					(a isFogName or: [ a isFogFunction ])
						ifTrue: [ a fetchValueFromDictionary: aCollection asDictionary ]
						ifFalse: [ a ] ].
			self reduceUsing: argumentsToUse and: (self receiverFor: aCollection) ]
		ifFalse: [ self reduce ]