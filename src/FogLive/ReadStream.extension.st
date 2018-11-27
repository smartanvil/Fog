Extension { #name : #ReadStream }

{ #category : #'*FogDB' }
ReadStream >> previous: anInteger [
	| ans endPosition |
	endPosition := position - anInteger max: 1.
	ans := collection copyFrom: endPosition to: (position - 1) .
	position := endPosition.
	^ ans
]

{ #category : #'*FogDB' }
ReadStream >> retroReading [
	position := readLimit + 1.
	^ self 
]
