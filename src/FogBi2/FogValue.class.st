"
Value wrapper that provides some extra information and links in between objects 
"
Class {
	#name : #FogValue,
	#superclass : #RTBuilder,
	#instVars : [
		'name',
		'value',
		'showInRoassalBlock'
	],
	#category : 'FogBi2-Charting'
}

{ #category : #accessing }
FogValue >> build [
	"Simply render the view"
	self renderIn: self view.
	^ self view
]

{ #category : #accessing }
FogValue >> builderInstance [
	^ value
		ifNil: [ self error: 'Not value set yet' ]
		ifNotNil: [ value class relatedBuilder new ]
]

{ #category : #accessing }
FogValue >> convertToString [
	^ (GTObjectPrinter new asTruncatedTextFrom: value value) asString 
]

{ #category : #accessing }
FogValue >> initialize [
	showInRoassalBlock := true.
]

{ #category : #accessing }
FogValue >> name [
	^ name
]

{ #category : #accessing }
FogValue >> name: anObject [
	name := anObject
]

{ #category : #accessing }
FogValue >> printOn: aStream [
	^ aStream nextPutAll: self convertToString
]

{ #category : #accessing }
FogValue >> showInRoassalBlock [
	^ showInRoassalBlock
]

{ #category : #accessing }
FogValue >> showInRoassalBlock: aBool [
	showInRoassalBlock := aBool
]

{ #category : #accessing }
FogValue >> showInTable [
	^ true
]

{ #category : #accessing }
FogValue >> value [
	^ value value
]

{ #category : #accessing }
FogValue >> value: anObject [
	value := anObject
]

{ #category : #accessing }
FogValue >> view [
	^ view ifNil: [ view := self createView ]
]
