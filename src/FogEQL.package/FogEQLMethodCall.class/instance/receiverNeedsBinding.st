testing
receiverNeedsBinding
	^ receiver isFogName or: [ receiver isFogFunction and: [ receiver needsBinding ] ]