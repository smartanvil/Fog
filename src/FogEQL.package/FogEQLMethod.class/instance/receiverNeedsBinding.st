testing
receiverNeedsBinding
	^ receiver isFogName or: [ receiver isEQLMethod and: [ receiver needsBinding ] ]