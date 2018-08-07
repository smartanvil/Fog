"
As an array 
"
Class {
	#name : #FogArrayValue,
	#superclass : #FogValue,
	#category : 'FogBi2-Charting'
}

{ #category : #'as yet unclassified' }
FogArrayValue >> collectionBrief [
	^ value value ifEmpty: [ ' No items ' ] ifNotEmpty: [ '{1} item(s)' format: {value value size} ]
]

{ #category : #accessing }
FogArrayValue >> convertToString [
	^  (GTObjectPrinter new asTruncatedTextFrom: self collectionBrief) asString
]
