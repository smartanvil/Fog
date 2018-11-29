"
Marshalling object
"
Class {
	#name : #FogHexadecimalPacker,
	#superclass : #Object,
	#traits : 'TFogPack',
	#classTraits : 'TFogPack classTrait',
	#category : 'FogLive-Util'
}

{ #category : #packing }
FogHexadecimalPacker class >> packSlotId: anInteger [
	^ self new packSlotId: anInteger
]

{ #category : #pack }
FogHexadecimalPacker >> dumpInt: anInteger size: aSize [
	^ anInteger asBKHexa: aSize * 2
]

{ #category : #unpack }
FogHexadecimalPacker >> load: aString size: aSize [
	^ aString asBKNumber 
]

{ #category : #pack }
FogHexadecimalPacker >> pack: aCollection with: aCollectionOfTypeNames [
	| pack |
	pack := OrderedCollection new.
	self assert: aCollection size = aCollectionOfTypeNames size.
	1 to: aCollection size do: [ :id | 
		| data typePacker |
		data := aCollection at: id.
		typePacker := ('pack' , (aCollectionOfTypeNames at: id) capitalized , ':') asSymbol.
		pack add: (self perform: typePacker withArguments: {data}) ].
	^ '' join: pack
]
