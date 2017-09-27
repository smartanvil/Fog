testing
receiverFor: aCollection
	^ self receiverNeedsBinding
		ifTrue: [ receiver fetchValueFromDictionary: aCollection asDictionary ]
		ifFalse: [ receiver ]