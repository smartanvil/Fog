accessing
next
	^ self session findBlockByNumber: self number + 1 full: true.
