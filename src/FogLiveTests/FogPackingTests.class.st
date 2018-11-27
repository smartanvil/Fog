Class {
	#name : #FogPackingTests,
	#superclass : #FogTestCase,
	#instVars : [
		'packer'
	],
	#category : 'FogDBTests'
}

{ #category : #'address value' }
FogPackingTests >> decodedAddress [
	^ '0x3f8b33142f20121e523738e814ff0a1162c0d577'
]

{ #category : #'boolean values' }
FogPackingTests >> decodedBool [ ^ true
]

{ #category : #'int values' }
FogPackingTests >> decodedInt [
	^ self decodedInt256 
]

{ #category : #'int values' }
FogPackingTests >> decodedInt128 [
	^ 2 ** (128 / 2) -1
]

{ #category : #'int values' }
FogPackingTests >> decodedInt16 [
	^ 2 ** (16 / 2)-1
]

{ #category : #'int values' }
FogPackingTests >> decodedInt256 [
	^ 2 ** (256 / 2)-1
]

{ #category : #'int values' }
FogPackingTests >> decodedInt32 [
	^ 2 ** (32 / 2)-1
]

{ #category : #'int values' }
FogPackingTests >> decodedInt64 [
	^ 2 ** (64 / 2)-1
]

{ #category : #'int values' }
FogPackingTests >> decodedInt8 [
	^ 2 ** (8 / 2)-1
]

{ #category : #'string values' }
FogPackingTests >> decodedString [
	^ 'decodedString'
]

{ #category : #'uint values' }
FogPackingTests >> decodedUint [
	^ self decodedInt
]

{ #category : #'uint values' }
FogPackingTests >> decodedUint128 [
	^ self decodedInt128
]

{ #category : #'uint values' }
FogPackingTests >> decodedUint16 [
	^ self decodedInt16
]

{ #category : #'uint values' }
FogPackingTests >> decodedUint256 [
	^ self decodedInt256
]

{ #category : #'uint values' }
FogPackingTests >> decodedUint32 [
	^ self decodedInt32
]

{ #category : #'uint values' }
FogPackingTests >> decodedUint64 [
	^ self decodedInt64
]

{ #category : #'uint values' }
FogPackingTests >> decodedUint8 [
	^ self decodedInt8
]

{ #category : #'address value' }
FogPackingTests >> encodedAddress [ 

	^ '0x3f8b33142f20121e523738e814ff0a1162c0d577'
]

{ #category : #'boolean values' }
FogPackingTests >> encodedBool [ 
	^'01'.
]

{ #category : #'int values' }
FogPackingTests >> encodedInt [
	^'00000000000000000000000000000000ffffffffffffffffffffffffffffffff'

]

{ #category : #'int values' }
FogPackingTests >> encodedInt128 [
	^'0000000000000000ffffffffffffffff'

]

{ #category : #'int values' }
FogPackingTests >> encodedInt16 [
	^'00ff'

]

{ #category : #'int values' }
FogPackingTests >> encodedInt256 [
	^'00000000000000000000000000000000ffffffffffffffffffffffffffffffff'

]

{ #category : #'int values' }
FogPackingTests >> encodedInt32 [
	^'0000ffff'

]

{ #category : #'int values' }
FogPackingTests >> encodedInt64 [
	^'00000000ffffffff'

]

{ #category : #'int values' }
FogPackingTests >> encodedInt8 [
	^'0f'

]

{ #category : #'string values' }
FogPackingTests >> encodedString [
	^ '000000000000000000000000000000000000000000000000000000000000000d6465636f646564537472696e6700000000000000000000000000000000000000'
]

{ #category : #'uint values' }
FogPackingTests >> encodedUint [
	^'00000000000000000000000000000000ffffffffffffffffffffffffffffffff'

]

{ #category : #'uint values' }
FogPackingTests >> encodedUint128 [
	^'0000000000000000ffffffffffffffff'

]

{ #category : #'uint values' }
FogPackingTests >> encodedUint16 [
	^'00ff'

]

{ #category : #'uint values' }
FogPackingTests >> encodedUint256 [
	^'00000000000000000000000000000000ffffffffffffffffffffffffffffffff'

]

{ #category : #'uint values' }
FogPackingTests >> encodedUint32 [
	^'0000ffff'

]

{ #category : #'uint values' }
FogPackingTests >> encodedUint64 [
	^'00000000ffffffff'

]

{ #category : #'uint values' }
FogPackingTests >> encodedUint8 [
	^'0f'

]

{ #category : #'address value' }
FogPackingTests >> maximalDecodedAddress [ ^ self shouldBeImplemented
]

{ #category : #'boolean values' }
FogPackingTests >> maximalDecodedBool [ ^ self shouldBeImplemented
]

{ #category : #'int values' }
FogPackingTests >> maximalDecodedInt [
	^ self maximalDecodedInt256 
]

{ #category : #'int values' }
FogPackingTests >> maximalDecodedInt128 [
	^ 2 ** 127-1
]

{ #category : #'int values' }
FogPackingTests >> maximalDecodedInt16 [
	^ 2 ** 15-1
]

{ #category : #'int values' }
FogPackingTests >> maximalDecodedInt256 [
	^ 2 ** 255-1
]

{ #category : #'int values' }
FogPackingTests >> maximalDecodedInt32 [
	^ 2 ** 31-1
]

{ #category : #'int values' }
FogPackingTests >> maximalDecodedInt64 [
	^ 2 ** 63-1
]

{ #category : #'int values' }
FogPackingTests >> maximalDecodedInt8 [
	^ 2 ** 7-1
]

{ #category : #'string values' }
FogPackingTests >> maximalDecodedString [ ^ self shouldBeImplemented
]

{ #category : #'uint values' }
FogPackingTests >> maximalDecodedUint [
	^ self maximalDecodedUint256 
]

{ #category : #'uint values' }
FogPackingTests >> maximalDecodedUint128 [
	^ (2 ** 128) -1
]

{ #category : #'uint values' }
FogPackingTests >> maximalDecodedUint16 [
	^( 2 ** 16)-1
]

{ #category : #'uint values' }
FogPackingTests >> maximalDecodedUint256 [
	^ 2 ** 256 -1
]

{ #category : #'uint values' }
FogPackingTests >> maximalDecodedUint32 [
	^ 2 ** 32-1
]

{ #category : #'uint values' }
FogPackingTests >> maximalDecodedUint64 [
	^ 2 ** 64-1
]

{ #category : #'uint values' }
FogPackingTests >> maximalDecodedUint8 [
	^ 2 ** 8-1
]

{ #category : #'address value' }
FogPackingTests >> maximalEncodedAddress [ ^ self shouldBeImplemented
]

{ #category : #'boolean values' }
FogPackingTests >> maximalEncodedBool [ ^ self shouldBeImplemented
]

{ #category : #'int values' }
FogPackingTests >> maximalEncodedInt [
	^'7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'

]

{ #category : #'int values' }
FogPackingTests >> maximalEncodedInt128 [
	^'7fffffffffffffffffffffffffffffff'

]

{ #category : #'int values' }
FogPackingTests >> maximalEncodedInt16 [
	^'7fff'

]

{ #category : #'int values' }
FogPackingTests >> maximalEncodedInt256 [
	^'7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'

]

{ #category : #'int values' }
FogPackingTests >> maximalEncodedInt32 [
	^'7fffffff'

]

{ #category : #'int values' }
FogPackingTests >> maximalEncodedInt64 [
	^'7fffffffffffffff'

]

{ #category : #'int values' }
FogPackingTests >> maximalEncodedInt8 [
	^'7f'

]

{ #category : #'string values' }
FogPackingTests >> maximalEncodedString [ ^ self shouldBeImplemented
]

{ #category : #'uint values' }
FogPackingTests >> maximalEncodedUint [
	^'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'

]

{ #category : #'uint values' }
FogPackingTests >> maximalEncodedUint128 [
	^'ffffffffffffffffffffffffffffffff'

]

{ #category : #'uint values' }
FogPackingTests >> maximalEncodedUint16 [
	^'ffff'

]

{ #category : #'uint values' }
FogPackingTests >> maximalEncodedUint256 [
	^'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'

]

{ #category : #'uint values' }
FogPackingTests >> maximalEncodedUint32 [
	^'ffffffff'

]

{ #category : #'uint values' }
FogPackingTests >> maximalEncodedUint64 [
	^'ffffffffffffffff'

]

{ #category : #'uint values' }
FogPackingTests >> maximalEncodedUint8 [
	^'ff'

]

{ #category : #'address value' }
FogPackingTests >> minimalDecodedAddress [ ^ self shouldBeImplemented
]

{ #category : #'boolean values' }
FogPackingTests >> minimalDecodedBool [ ^ self shouldBeImplemented
]

{ #category : #'int values' }
FogPackingTests >> minimalDecodedInt [
	^ self minimalDecodedInt256 
]

{ #category : #'int values' }
FogPackingTests >> minimalDecodedInt128 [
	^ 2 ** 127 -1 * -1
]

{ #category : #'int values' }
FogPackingTests >> minimalDecodedInt16 [
	^ (2 ** 15 - 1) * -1
]

{ #category : #'int values' }
FogPackingTests >> minimalDecodedInt256 [
	^ 2 ** 255 -1* -1
]

{ #category : #'int values' }
FogPackingTests >> minimalDecodedInt32 [
	^ 2 ** 31 -1* -1
]

{ #category : #'int values' }
FogPackingTests >> minimalDecodedInt64 [
	^ 2 ** 63 -1* -1
]

{ #category : #'int values' }
FogPackingTests >> minimalDecodedInt8 [
	^ 2 ** 7 -1* -1
]

{ #category : #'string values' }
FogPackingTests >> minimalDecodedString [ ^ self shouldBeImplemented
]

{ #category : #'uint values' }
FogPackingTests >> minimalDecodedUint [
	^ self minimalDecodedUint256 
]

{ #category : #'uint values' }
FogPackingTests >> minimalDecodedUint128 [
	^ 0
]

{ #category : #'uint values' }
FogPackingTests >> minimalDecodedUint16 [
	^ 0
]

{ #category : #'uint values' }
FogPackingTests >> minimalDecodedUint256 [
	^ 0
]

{ #category : #'uint values' }
FogPackingTests >> minimalDecodedUint32 [
	^ 0
]

{ #category : #'uint values' }
FogPackingTests >> minimalDecodedUint64 [
	^ 0
]

{ #category : #'uint values' }
FogPackingTests >> minimalDecodedUint8 [
	^ 0
]

{ #category : #'address value' }
FogPackingTests >> minimalEncodedAddress [ ^ self shouldBeImplemented
]

{ #category : #'boolean values' }
FogPackingTests >> minimalEncodedBool [ ^ self shouldBeImplemented
]

{ #category : #'int values' }
FogPackingTests >> minimalEncodedInt [
	^'8000000000000000000000000000000000000000000000000000000000000001'

]

{ #category : #'int values' }
FogPackingTests >> minimalEncodedInt128 [
	^'80000000000000000000000000000001'

]

{ #category : #'int values' }
FogPackingTests >> minimalEncodedInt16 [
	^'8001'

]

{ #category : #'int values' }
FogPackingTests >> minimalEncodedInt256 [
	^'8000000000000000000000000000000000000000000000000000000000000001'

]

{ #category : #'int values' }
FogPackingTests >> minimalEncodedInt32 [
	^'80000001'

]

{ #category : #'int values' }
FogPackingTests >> minimalEncodedInt64 [
	^'8000000000000001'

]

{ #category : #'int values' }
FogPackingTests >> minimalEncodedInt8 [
	^'81'

]

{ #category : #'string values' }
FogPackingTests >> minimalEncodedString [ ^ self shouldBeImplemented
]

{ #category : #'uint values' }
FogPackingTests >> minimalEncodedUint [
	^'0000000000000000000000000000000000000000000000000000000000000000'

]

{ #category : #'uint values' }
FogPackingTests >> minimalEncodedUint128 [
	^'00000000000000000000000000000000'

]

{ #category : #'uint values' }
FogPackingTests >> minimalEncodedUint16 [
	^'0000'

]

{ #category : #'uint values' }
FogPackingTests >> minimalEncodedUint256 [
	^'0000000000000000000000000000000000000000000000000000000000000000'

]

{ #category : #'uint values' }
FogPackingTests >> minimalEncodedUint32 [
	^'00000000'

]

{ #category : #'uint values' }
FogPackingTests >> minimalEncodedUint64 [
	^'0000000000000000'

]

{ #category : #'uint values' }
FogPackingTests >> minimalEncodedUint8 [
	^'00'

]

{ #category : #initialization }
FogPackingTests >> setUp [
	super setUp.
	packer:= FogHexadecimalPacker new 
]

{ #category : #'packing test' }
FogPackingTests >> testMaximalPackInt [
	self assert: (packer packInt: self maximalDecodedInt) equals: self maximalEncodedInt

]

{ #category : #'packing test' }
FogPackingTests >> testMaximalPackInt128 [
	self assert: (packer packInt128: self maximalDecodedInt128) equals: self maximalEncodedInt128

]

{ #category : #'packing test' }
FogPackingTests >> testMaximalPackInt16 [
	self assert: (packer packInt16: self maximalDecodedInt16) equals: self maximalEncodedInt16

]

{ #category : #'packing test' }
FogPackingTests >> testMaximalPackInt256 [
	self assert: (packer packInt256: self maximalDecodedInt256) equals: self maximalEncodedInt256

]

{ #category : #'packing test' }
FogPackingTests >> testMaximalPackInt32 [
	self assert: (packer packInt32: self maximalDecodedInt32) equals: self maximalEncodedInt32

]

{ #category : #'packing test' }
FogPackingTests >> testMaximalPackInt64 [
	self assert: (packer packInt64: self maximalDecodedInt64) equals: self maximalEncodedInt64

]

{ #category : #'packing test' }
FogPackingTests >> testMaximalPackInt8 [
	self assert: (packer packInt8: self maximalDecodedInt8) equals: self maximalEncodedInt8

]

{ #category : #'packing test' }
FogPackingTests >> testMaximalPackUint [
	self assert: (packer packUint: self maximalDecodedUint) equals: self maximalEncodedUint

]

{ #category : #'packing test' }
FogPackingTests >> testMaximalPackUint128 [
	self assert: (packer packUint128: self maximalDecodedUint128) equals: self maximalEncodedUint128

]

{ #category : #'packing test' }
FogPackingTests >> testMaximalPackUint16 [
	self assert: (packer packUint16: self maximalDecodedUint16) equals: self maximalEncodedUint16

]

{ #category : #'packing test' }
FogPackingTests >> testMaximalPackUint256 [
	self assert: (packer packUint256: self maximalDecodedUint256) equals: self maximalEncodedUint256

]

{ #category : #'packing test' }
FogPackingTests >> testMaximalPackUint32 [
	self assert: (packer packUint32: self maximalDecodedUint32) equals: self maximalEncodedUint32

]

{ #category : #'packing test' }
FogPackingTests >> testMaximalPackUint64 [
	self assert: (packer packUint64: self maximalDecodedUint64) equals: self maximalEncodedUint64

]

{ #category : #'packing test' }
FogPackingTests >> testMaximalPackUint8 [
	self assert: (packer packUint8: self maximalDecodedUint8) equals: self maximalEncodedUint8

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMaximalUnpackInt [
	self assert: (packer unpackInt: self maximalEncodedInt) equals: self maximalDecodedInt

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMaximalUnpackInt128 [
	self assert: (packer unpackInt128: self maximalEncodedInt128) equals: self maximalDecodedInt128

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMaximalUnpackInt16 [
	self assert: (packer unpackInt16: self maximalEncodedInt16) equals: self maximalDecodedInt16

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMaximalUnpackInt256 [
	self assert: (packer unpackInt256: self maximalEncodedInt256) equals: self maximalDecodedInt256

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMaximalUnpackInt32 [
	self assert: (packer unpackInt32: self maximalEncodedInt32) equals: self maximalDecodedInt32

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMaximalUnpackInt64 [
	self assert: (packer unpackInt64: self maximalEncodedInt64) equals: self maximalDecodedInt64

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMaximalUnpackInt8 [
	self assert: (packer unpackInt8: self maximalEncodedInt8) equals: self maximalDecodedInt8

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMaximalUnpackUint [
	self assert: (packer unpackUint: self maximalEncodedUint) equals: self maximalDecodedUint

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMaximalUnpackUint256 [
	self assert: (packer unpackUint256: self maximalEncodedUint256) equals: self maximalDecodedUint256

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMaximalUnpackUint32 [
	self assert: (packer unpackUint32: self maximalEncodedUint32) equals: self maximalDecodedUint32

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMaximalUnpackUint64 [
	self assert: (packer unpackUint64: self maximalEncodedUint64) equals: self maximalDecodedUint64

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMaximalUnpackUint8 [
	self assert: (packer unpackUint8: self maximalEncodedUint8) equals: self maximalDecodedUint8

]

{ #category : #'packing test' }
FogPackingTests >> testMinimalPackInt [
	self assert: (packer packInt: self minimalDecodedInt) equals: self minimalEncodedInt.

]

{ #category : #'packing test' }
FogPackingTests >> testMinimalPackInt128 [
	self assert: (packer packInt128: self minimalDecodedInt128) equals: self minimalEncodedInt128.

]

{ #category : #'packing test' }
FogPackingTests >> testMinimalPackInt16 [
	self assert: (packer packInt16: self minimalDecodedInt16) equals: self minimalEncodedInt16.

]

{ #category : #'packing test' }
FogPackingTests >> testMinimalPackInt256 [
	self assert: (packer packInt256: self minimalDecodedInt256) equals: self minimalEncodedInt256.

]

{ #category : #'packing test' }
FogPackingTests >> testMinimalPackInt32 [
	self assert: (packer packInt32: self minimalDecodedInt32) equals: self minimalEncodedInt32.

]

{ #category : #'packing test' }
FogPackingTests >> testMinimalPackInt64 [
	self assert: (packer packInt64: self minimalDecodedInt64) equals: self minimalEncodedInt64.

]

{ #category : #'packing test' }
FogPackingTests >> testMinimalPackInt8 [
	self assert: (packer packInt8: self minimalDecodedInt8) equals: self minimalEncodedInt8.

]

{ #category : #'packing test' }
FogPackingTests >> testMinimalPackUint [
	self assert: (packer packUint: self minimalDecodedUint) equals: self minimalEncodedUint.

]

{ #category : #'packing test' }
FogPackingTests >> testMinimalPackUint128 [
	self assert: (packer packUint128: self minimalDecodedUint128) equals: self minimalEncodedUint128.

]

{ #category : #'packing test' }
FogPackingTests >> testMinimalPackUint16 [
	self assert: (packer packUint16: self minimalDecodedUint16) equals: self minimalEncodedUint16.

]

{ #category : #'packing test' }
FogPackingTests >> testMinimalPackUint256 [
	self assert: (packer packUint256: self minimalDecodedUint256) equals: self minimalEncodedUint256.

]

{ #category : #'packing test' }
FogPackingTests >> testMinimalPackUint32 [
	self assert: (packer packUint32: self minimalDecodedUint32) equals: self minimalEncodedUint32.

]

{ #category : #'packing test' }
FogPackingTests >> testMinimalPackUint64 [
	self assert: (packer packUint64: self minimalDecodedUint64) equals: self minimalEncodedUint64.

]

{ #category : #'packing test' }
FogPackingTests >> testMinimalPackUint8 [
	self assert: (packer packUint8: self minimalDecodedUint8) equals: self minimalEncodedUint8.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMinimalUnpackInt [
	self assert: (packer unpackInt: self minimalEncodedInt) equals: self minimalDecodedInt.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMinimalUnpackInt128 [
	self assert: (packer unpackInt128: self minimalEncodedInt128) equals: self minimalDecodedInt128.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMinimalUnpackInt16 [
	self assert: (packer unpackInt16: self minimalEncodedInt16) equals: self minimalDecodedInt16.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMinimalUnpackInt256 [
	self assert: (packer unpackInt256: self minimalEncodedInt256) equals: self minimalDecodedInt256.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMinimalUnpackInt32 [
	self assert: (packer unpackInt32: self minimalEncodedInt32) equals: self minimalDecodedInt32.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMinimalUnpackInt64 [
	self assert: (packer unpackInt64: self minimalEncodedInt64) equals: self minimalDecodedInt64.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMinimalUnpackInt8 [
	self assert: (packer unpackInt8: self minimalEncodedInt8) equals: self minimalDecodedInt8.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMinimalUnpackUint [
	self assert: (packer unpackUint: self minimalEncodedUint) equals: self minimalDecodedUint.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMinimalUnpackUint256 [
	self assert: (packer unpackUint256: self minimalEncodedUint256) equals: self minimalDecodedUint256.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMinimalUnpackUint32 [
	self assert: (packer unpackUint32: self minimalEncodedUint32) equals: self minimalDecodedUint32.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMinimalUnpackUint64 [
	self assert: (packer unpackUint64: self minimalEncodedUint64) equals: self minimalDecodedUint64.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testMinimalUnpackUint8 [
	self assert: (packer unpackUint8: self minimalEncodedUint8) equals: self minimalDecodedUint8.

]

{ #category : #'packing test' }
FogPackingTests >> testPackInt [
	self assert: (packer packInt: self decodedInt) equals: self encodedInt.

]

{ #category : #'packing test' }
FogPackingTests >> testPackInt128 [
	self assert: (packer packInt128: self decodedInt128) equals: self encodedInt128.

]

{ #category : #'packing test' }
FogPackingTests >> testPackInt16 [
	self assert: (packer packInt16: self decodedInt16) equals: self encodedInt16.

]

{ #category : #'packing test' }
FogPackingTests >> testPackInt256 [
	self assert: (packer packInt256: self decodedInt256) equals: self encodedInt256.

]

{ #category : #'packing test' }
FogPackingTests >> testPackInt32 [
	self assert: (packer packInt32: self decodedInt32) equals: self encodedInt32.

]

{ #category : #'packing test' }
FogPackingTests >> testPackInt64 [
	self assert: (packer packInt64: self decodedInt64) equals: self encodedInt64.

]

{ #category : #'packing test' }
FogPackingTests >> testPackInt8 [
	self assert: (packer packInt8: self decodedInt8) equals: self encodedInt8.

]

{ #category : #'packing test' }
FogPackingTests >> testPackString [
	self assert: (FogStringType new pack: self decodedString using: packer) equals: self encodedString
]

{ #category : #'packing test' }
FogPackingTests >> testPackUint [
	self assert: (packer packUint: self decodedUint) equals: self encodedUint.

]

{ #category : #'packing test' }
FogPackingTests >> testPackUint128 [
	self assert: (packer packUint128: self decodedUint128) equals: self encodedUint128.

]

{ #category : #'packing test' }
FogPackingTests >> testPackUint16 [
	self assert: (packer packUint16: self decodedUint16) equals: self encodedUint16.

]

{ #category : #'packing test' }
FogPackingTests >> testPackUint256 [
	self assert: (packer packUint256: self decodedUint256) equals: self encodedUint256.

]

{ #category : #'packing test' }
FogPackingTests >> testPackUint32 [
	self assert: (packer packUint32: self decodedUint32) equals: self encodedUint32.

]

{ #category : #'packing test' }
FogPackingTests >> testPackUint64 [
	self assert: (packer packUint64: self decodedUint64) equals: self encodedUint64.

]

{ #category : #'packing test' }
FogPackingTests >> testPackUint8 [
	self assert: (packer packUint8: self decodedUint8) equals: self encodedUint8.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testUnpackAddress [
	self assert: (packer unpackAddress: self encodedAddress) equals: self decodedAddress.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testUnpackBool [
	self assert: (packer unpackBool: self encodedBool) equals: self decodedBool.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testUnpackInt [
	self assert: (packer unpackInt: self encodedInt) equals: self decodedInt.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testUnpackInt128 [
	self assert: (packer unpackInt128: self encodedInt128) equals: self decodedInt128.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testUnpackInt16 [
	self assert: (packer unpackInt16: self encodedInt16) equals: self decodedInt16.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testUnpackInt256 [
	self assert: (packer unpackInt256: self encodedInt256) equals: self decodedInt256.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testUnpackInt32 [
	self assert: (packer unpackInt32: self encodedInt32) equals: self decodedInt32.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testUnpackInt64 [
	self assert: (packer unpackInt64: self encodedInt64) equals: self decodedInt64.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testUnpackInt8 [
	self assert: (packer unpackInt8: self encodedInt8) equals: self decodedInt8.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testUnpackUint [
	self assert: (packer unpackUint: self encodedUint) equals: self decodedUint
]

{ #category : #'unpackin tests' }
FogPackingTests >> testUnpackUint256 [
	self assert: (packer unpackUint256: self encodedUint256) equals: self decodedUint256.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testUnpackUint32 [
	self assert: (packer unpackUint32: self encodedUint32) equals: self decodedUint32.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testUnpackUint64 [
	self assert: (packer unpackUint64: self encodedUint64) equals: self decodedUint64.

]

{ #category : #'unpackin tests' }
FogPackingTests >> testUnpackUint8 [
	self assert: (packer unpackUint8: self encodedUint8) equals: self decodedUint8.

]
