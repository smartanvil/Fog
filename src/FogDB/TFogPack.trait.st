"
General packing / unpacking logics/ It realies on the guest for implementing 
#dumpInt:size
and 
#load:size:
for defining the way of encoding 
"
Trait {
	#name : #TFogPack,
	#category : 'FogDB-Util'
}

{ #category : #required }
TFogPack >> dumpInt: anInteger size: aSize [
	self requiredMethod 
]

{ #category : #required }
TFogPack >> load: aString size: aSize [
	self requiredMethod
]

{ #category : #pack }
TFogPack >> pack: aCollection with: aCollectionOfTypeNames [
	self requiredMethod 
]

{ #category : #pack }
TFogPack >> pack: aCollection withTypes: typeCollection [
	| result |
	self assert: aCollection size = typeCollection size.
	result := ''.
	aCollection
		with: typeCollection
		do: [ :data :type | result := result , (type pack: data using: self) ].
	^ result
]

{ #category : #pack }
TFogPack >> packAddress: aString [ 
	^ aString asPackingAddress 
]

{ #category : #pack }
TFogPack >> packBool: aBool [
	aBool = true ifTrue: [ ^ self packUint8: 1 ].
	aBool = false ifTrue: [ ^ self packUint8: 0 ].
	self error: 'Expected boolean value'.

]

{ #category : #pack }
TFogPack >> packInt128: aString [
	| size inverse |
	size := 170141183460469231731687303715884105727.
	inverse := 340282366920938463463374607431768211456.
	^ self packUint128: (self uintFor: aString maxPositive: size maxNumber: inverse). 

]

{ #category : #pack }
TFogPack >> packInt16: aString [
	| size inverse |
	size := 32767.
	inverse := 65536.
	^ self packUint16: (self uintFor: aString maxPositive: size maxNumber: inverse)
]

{ #category : #pack }
TFogPack >> packInt256: aString [
	|  size inverse |
	size := 57896044618658097711785492504343953926634992332820282019728792003956564819967.
	inverse := 115792089237316195423570985008687907853269984665640564039457584007913129639936.
	^ self packUint256: (self uintFor: aString maxPositive: size maxNumber: inverse). 

]

{ #category : #pack }
TFogPack >> packInt32: aString [
	| size inverse |
	size := 2147483647.
	inverse := 4294967296.
	^ self packUint32:(self uintFor: aString maxPositive: size maxNumber: inverse)
]

{ #category : #pack }
TFogPack >> packInt64: aString [
	| size inverse |
	size := 9223372036854775807.
	inverse := 18446744073709551616.
	^ self packUint64: (self uintFor: aString maxPositive: size maxNumber: inverse)
]

{ #category : #pack }
TFogPack >> packInt8: aString [
	| size inverse |
	size := 127.
	inverse := 256.
	^ self packUint8: (self uintFor: aString maxPositive: size maxNumber: inverse)
]

{ #category : #pack }
TFogPack >> packInt: anInteger [ 
	^ self packInt256: anInteger
]

{ #category : #'as yet unclassified' }
TFogPack >> packSlotId: anInteger [ 
	^ self packUint256: anInteger 
]

{ #category : #pack }
TFogPack >> packUint128: anInteger [
	^ self dumpInt: anInteger size: 16
]

{ #category : #pack }
TFogPack >> packUint16: anInteger [
	^ self dumpInt: anInteger size: 2
]

{ #category : #pack }
TFogPack >> packUint256: anInteger [
	^ self dumpInt: anInteger size: 32
]

{ #category : #pack }
TFogPack >> packUint32: anInteger [
	^ self dumpInt: anInteger size: 4
]

{ #category : #pack }
TFogPack >> packUint64: anInteger [
	^ self dumpInt: anInteger size: 8
]

{ #category : #pack }
TFogPack >> packUint8: anInteger [
	^ self dumpInt: anInteger size: 1
]

{ #category : #pack }
TFogPack >> packUint: anInteger [
	^ self packUint256: anInteger
]

{ #category : #pack }
TFogPack >> uintFor: anInt maxPositive: size maxNumber: inverse [
	anInt > size
		ifTrue: [ self error: ' Number is not expressed in the given size ' ].
	anInt < size negated
		ifTrue: [ self error: ' Number is not expressed in the given size ' ].
	^ anInt > 0
		ifTrue: [ anInt ]
		ifFalse: [ anInt + inverse ]
]

{ #category : #unpack }
TFogPack >> unpack: aStream with: anOrderedCollectionOfTypeNames [
	(aStream indexOfSubCollection: '0x') > 0
		ifTrue: [ self error: 'headless string was expected ' ].
	^ anOrderedCollectionOfTypeNames
		collect: [ :t | self perform: ('unpack' , t capitalized , ':') asSymbol withArguments: {aStream} ]
]

{ #category : #unpack }
TFogPack >> unpack: aString withTypes: aCollection [
	^ aCollection collect: [ :t | t unpack: aString using: self ]
]

{ #category : #unpack }
TFogPack >> unpackAddress: aString [ 
	^ aString asBKNumber asBKHexa
]

{ #category : #unpack }
TFogPack >> unpackBool: aString [
	| value |
	value := self unpackUint8: aString.
	value = 0
		ifTrue: [ ^ false ]
		ifFalse: [ ^ true  ].
	self error: 'Unexpected boolean representation: ' , aString
]

{ #category : #unpack }
TFogPack >> unpackInt128: aString [
	| size inverse |
	size := 170141183460469231731687303715884105727.
	inverse := 340282366920938463463374607431768211456.
	^ self unpackInt: aString maxPositive: size maxNumber: inverse bitLength: 128
]

{ #category : #unpack }
TFogPack >> unpackInt16: aString [
	| size inverse |
	size := 32767.
	inverse := 65536.
	^ self unpackInt: aString maxPositive: size maxNumber: inverse  bitLength: 16
]

{ #category : #unpack }
TFogPack >> unpackInt256: aString [
	| size inverse |
	size := 57896044618658097711785492504343953926634992332820282019728792003956564819967.
	inverse := 115792089237316195423570985008687907853269984665640564039457584007913129639936.
	^ self unpackInt: aString maxPositive: size maxNumber: inverse  bitLength: 256
]

{ #category : #unpack }
TFogPack >> unpackInt32: aString [
	| size inverse |
	size := 2147483647.
	inverse := 4294967296.
	^ self unpackInt: aString maxPositive: size maxNumber: inverse  bitLength: 32
]

{ #category : #unpack }
TFogPack >> unpackInt64: aString [
	| size inverse |
	size := 9223372036854775807.
	inverse := 18446744073709551616.
	^ self unpackInt: aString maxPositive: size maxNumber: inverse  bitLength: 64
]

{ #category : #unpack }
TFogPack >> unpackInt8: aString [
	| size inverse |
	size := 127.
	inverse := 256.
	^ self unpackInt: aString maxPositive: size maxNumber: inverse bitLength: 8
]

{ #category : #unpack }
TFogPack >> unpackInt: aString [
	^ self unpackInt256: aString
]

{ #category : #unpack }
TFogPack >> unpackInt: aString maxPositive: size maxNumber: inverse bitLength: bitLength [
	| uint |
	uint := 	self load: aString size: bitLength .
	uint > inverse
		ifTrue: [ self error: ' Number is not expressed in the given size ' ].
	^ uint <= size
		ifTrue: [ uint ]
		ifFalse: [ uint - inverse ]
]

{ #category : #unpack }
TFogPack >> unpackUint256: aString [
	^ self load: aString size: 256
]

{ #category : #unpack }
TFogPack >> unpackUint32: aString [
	^ self load: aString size: 32
]

{ #category : #unpack }
TFogPack >> unpackUint64: aString [
	^ self load: aString size: 64
]

{ #category : #unpack }
TFogPack >> unpackUint8: aString [
	^ self load: aString size: 8
]

{ #category : #unpack }
TFogPack >> unpackUint: aString [
	^ self load: aString size: 256
]
