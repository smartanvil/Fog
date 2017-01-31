as yet unclassified
resolve: aString
	| selector |
	(types includesKey: aString)
		ifTrue: [ ^ types at: aString ].
	selector := self selector: aString.
	(self respondsTo: selector)
		ifTrue: [ ^ self install: ((self perform: selector) name: aString) ].
	types values
		detect: [ :t | t matches: aString ]
		ifFound: [ :t | ^ t ]
		ifNone: [ SASTChainForceDeferredTypeResolution signal ].