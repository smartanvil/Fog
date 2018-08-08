"
Struct type marshal/unmarshal 
"
Class {
	#name : #FogStructType,
	#superclass : #FogType,
	#instVars : [
		'fields'
	],
	#category : 'FogDB-Meta-Types'
}

{ #category : #collecting }
FogStructType >> collect: aBlock [
	^ fields collect: [ :b | aBlock value: b type ]
]

{ #category : #accessing }
FogStructType >> fields: aCollection [ 
	fields := aCollection
]

{ #category : #testing }
FogStructType >> isStruct [
	^ true. 
]

{ #category : #accessing }
FogStructType >> name [
	^ 'struct'
]

{ #category : #printing }
FogStructType >> printOn: aStream [
	aStream
		nextPutAll: self name;
		nextPutAll: '('.
	fields do: [ :f | f printOn: aStream. aStream nextPutAll: ' ' ].
	aStream nextPutAll: ')'.
]

{ #category : #marshaling }
FogStructType >> staticSlotSize [
	^ fields inject: 0 into: [ :acc :f | acc + f type staticSlotSize  ]
]

{ #category : #marshaling }
FogStructType >> unpack: aSetOfStrings using: anETHPacker [
	^ (aSetOfStrings
		with: fields
		collect: [ :content :field | field name -> (field type unpack: content using: anETHPacker) ])
		asDictionary
]

{ #category : #marshaling }
FogStructType >> unpackStream: aReadStream using: aFogPacker [
	| content substream |
	content := aReadStream contents.
	substream := (content
		copyFrom: content size - (self staticSlotSize * 2 - 1)
		to: content size) readStream.
	^ (fields reverse
		collect: [ :f | f name -> (f unpackStream: substream using: aFogPacker) ]) asDictionary
]
