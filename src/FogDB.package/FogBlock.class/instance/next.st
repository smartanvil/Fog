accessing
next
	^ self connection findBlockByNumber: self number + 1 full: true.
