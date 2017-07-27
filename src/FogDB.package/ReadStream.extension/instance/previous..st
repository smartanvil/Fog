*FogDB
previous: anInteger
	| ans endPosition |
	endPosition := position - anInteger max: 1.
	ans := collection copyFrom: endPosition to: (position - 1) .
	position := endPosition.
	^ ans