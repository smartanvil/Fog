Extension { #name : #ReadStream }

{ #category : #'*FogLive' }
ReadStream >> previous: anInteger [
	| ans endPosition |
	endPosition := position - anInteger max: 1.
	ans := collection copyFrom: endPosition to: (position - 1) .
	position := endPosition.
	^ ans
]

{ #category : #'*FogLive' }
ReadStream >> retroReading [
	position := readLimit + 1.
	^ self 
]
