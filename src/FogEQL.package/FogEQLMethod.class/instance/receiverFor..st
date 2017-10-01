testing
receiverFor: aCollection
	^ self receiverNeedsBinding
		ifTrue: [ receiver valueWithDictionaryArguments: aCollection asDictionary ]
		ifFalse: [ receiver ]