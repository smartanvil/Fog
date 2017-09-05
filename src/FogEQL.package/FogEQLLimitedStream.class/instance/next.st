as yet unclassified
next
	^ amountGiven < limit
		ifTrue: [ amountGiven := amountGiven + 1.
			source next ]
		ifFalse: [ nil ]