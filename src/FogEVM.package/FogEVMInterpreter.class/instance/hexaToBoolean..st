as yet unclassified
hexaToBoolean: anInteger
	^ anInteger asBKNumber = 0
		ifTrue: [ false ]
		ifFalse: [ true ]