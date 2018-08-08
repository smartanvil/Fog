"
This object represents a map of a property in the memory layout
"
Class {
	#name : #FogSolidityLayoutMapping,
	#superclass : #Object,
	#instVars : [
		'fromSlot',
		'fromByte',
		'toSlot',
		'toByte'
	],
	#category : 'FogDB-Meta-SolidityLayout'
}

{ #category : #'as yet unclassified' }
FogSolidityLayoutMapping >> extractFromSlot: slot [
	| charactersToRead from |
	charactersToRead := (toByte - fromByte) * 2 + 1.
	from := slot size - (fromByte * 2).
	^ slot copyFrom: from - charactersToRead to: from
]

{ #category : #'as yet unclassified' }
FogSolidityLayoutMapping >> fromByte [
	^ fromByte
]

{ #category : #'as yet unclassified' }
FogSolidityLayoutMapping >> fromSlot [
	^ fromSlot
]

{ #category : #'as yet unclassified' }
FogSolidityLayoutMapping >> fromSlot: anInteger byte: anInteger2 [
	fromSlot := anInteger.
	fromByte := anInteger2
]

{ #category : #'as yet unclassified' }
FogSolidityLayoutMapping >> toByte [
	^ toByte
]

{ #category : #'as yet unclassified' }
FogSolidityLayoutMapping >> toSlot [
	^ toSlot
]

{ #category : #'as yet unclassified' }
FogSolidityLayoutMapping >> toSlot: anInteger byte: anInteger2 [
	toSlot := anInteger.
	toByte := anInteger2
]

{ #category : #'as yet unclassified' }
FogSolidityLayoutMapping >> using: aSession fetch: aMirrorProperty from: aContractAddress at: aBlockTagNumberOrHash [
	^ aSession
		decode: (self using: aSession fetchContentsFrom: aContractAddress at: aBlockTagNumberOrHash)
		type: aMirrorProperty type
]

{ #category : #'as yet unclassified' }
FogSolidityLayoutMapping >> using: aSession fetchContentsFrom: aContractAddress at: aBlockTagNumberOrHash [
	self assert: fromSlot = toSlot.
	^ self
		extractFromSlot:
			(aSession
				fetchSlot: fromSlot
				onContract: aContractAddress
				at: aBlockTagNumberOrHash)
]
