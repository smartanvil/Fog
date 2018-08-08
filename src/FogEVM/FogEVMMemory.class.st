"
This class represents a continuum memory segment. 

"
Class {
	#name : #FogEVMMemory,
	#superclass : #Object,
	#instVars : [
		'layout'
	],
	#category : 'FogEVM-Memory'
}

{ #category : #'as yet unclassified' }
FogEVMMemory >> fetchFrom: anHexaAddressFrom to: anHexaAddressTo [
	| value |
	value := '' writeStream.
	value nextPutAll: '0x'.
	anHexaAddressFrom asBKNumber to: anHexaAddressTo asBKNumber - 1 do: [ :id | 
		| memoryValue |
		memoryValue := self fetchValue: id asBKHexa.
		value nextPutAll: (memoryValue copyFrom: 3 to: memoryValue size) ].
	^ value contents
]

{ #category : #'as yet unclassified' }
FogEVMMemory >> fetchValue: aString [
	^ layout at: aString ifAbsent: [ (layout associations detect: [ :a | a key asBKNumber = aString asBKNumber ] ifNone: [ layout at: aString put: 0 asBKHexa ]) value ]
]

{ #category : #initialization }
FogEVMMemory >> initialize [
	super initialize.
	layout := Dictionary new 
]

{ #category : #'as yet unclassified' }
FogEVMMemory >> store: aValue at: anAddress [
	layout at: anAddress put: aValue
]

{ #category : #accessing }
FogEVMMemory >> storeChunck: anHexaChunk startingAt: anAddress ensureBytes: ammountOfBytes [
	| address stream |
	address := anAddress asBKNumber.
	stream := anHexaChunk readStream.
	self assert: anHexaChunk size / 2 = ammountOfBytes.
	address to: ammountOfBytes  do: [ :i | self store: '0x' , (stream next: 2) at: (address + i) asBKHexa ]
]
