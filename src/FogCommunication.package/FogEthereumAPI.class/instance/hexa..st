as yet unclassified
hexa: aNumber
	^ (aNumber isString and: [ aNumber beginsWith: '0x' ])
		ifTrue: [ aNumber ]
		ifFalse: [ aNumber asBKHexa ]