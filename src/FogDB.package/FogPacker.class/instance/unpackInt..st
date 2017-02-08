as yet unclassified
unpackInt: aString
	| uint size |
	size := 57896044618658097711785492504343953926634992332820282019728792003956564819968.
	uint := aString asBKNumber.
	^ uint >= size
		ifTrue: [ uint ]
		ifFalse: [ size - uint ]