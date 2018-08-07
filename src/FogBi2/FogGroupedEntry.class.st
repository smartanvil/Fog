"
Entry object. For agregation functions representations 
"
Class {
	#name : #FogGroupedEntry,
	#superclass : #Object,
	#instVars : [
		'kind',
		'amount',
		'ammount'
	],
	#category : 'FogBi2-Charting'
}

{ #category : #'as yet unclassified' }
FogGroupedEntry >> ammount [
	^ ammount
]

{ #category : #'as yet unclassified' }
FogGroupedEntry >> ammount: anInteger [
	ammount := anInteger
]

{ #category : #kind }
FogGroupedEntry >> kind: aClass [ 
	kind := aClass
]

{ #category : #kind }
FogGroupedEntry >> printOn: aStream [
	^ kind asString printOn: aStream
]
