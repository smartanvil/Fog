testing
needsBinding
	^ arguments
		anySatisfy: [ :a | a isFogName or: [ a isFogFunction and: [ a needsBinding ] ] ]