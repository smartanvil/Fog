testing
needsBinding
	^ self receiverNeedsBinding
		or: [ arguments anySatisfy: [ :a | a isFogName or: [ a isEQLMethod and: [ a needsBinding ] ] ] ]