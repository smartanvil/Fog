Class {
	#name : #FogHashingCompatibilityTests,
	#superclass : #TestCase,
	#category : 'FogLiveTests'
}

{ #category : #tests }
FogHashingCompatibilityTests >> testGetArray [ 
self assert: 'd504ea1d554994576299872bd93ac7c6cece33689b0d74a7ad7061702d664d17' equals: (Keccak hashMessage:'getArray()' ) asByteArray hex
]

{ #category : #tests }
FogHashingCompatibilityTests >> testGetEnum [
	self assert: 'f0ebce5ad72bb24288c7e55736485a3b06bf1e5f4b4a7457f3eaf9571f6ade13' equals: (Keccak hashMessage: 'getEnum()')asByteArray hex
]

{ #category : #tests }
FogHashingCompatibilityTests >> testGetExample [
	self assert: 'bfdb629c6f75944815d014aa71431ccabcc563dbfb8087573f6551c48c054649' equals: (Keccak hashMessage: 'getExample()') asByteArray hex
]

{ #category : #tests }
FogHashingCompatibilityTests >> testGetExample2 [ 
self assert: '9133b2dbe5709687dcfff613fad76b0fcdf23e9e31ebddfdf39cfd2b90f03744' equals: (Keccak hashMessage:'getExample2()' ) asByteArray hex
]

{ #category : #tests }
FogHashingCompatibilityTests >> testGetExample3 [
	self assert: '469b040181a1d6492572dfdc780b053d0c681483cc6eb3ce9c8e9858c92bd274' equals: (Keccak hashMessage: 'getExample3()')asByteArray hex
]

{ #category : #tests }
FogHashingCompatibilityTests >> testGetNegativeInt [
	self assert: '53340aba8ee7e5776918d534102fe7dd00e3ec64480fca0c7ab502e314573613' equals: (Keccak hashMessage: 'getNegativeInt()')asByteArray hex
]

{ #category : #tests }
FogHashingCompatibilityTests >> testGetPositiveInt [
	self assert: 'f25c229d8ad21778e3784c73de8178aa61f1d68c2e0a73872519ed3e7690741d' equals: (Keccak hashMessage: 'getPositiveInt()')asByteArray hex
]

{ #category : #tests }
FogHashingCompatibilityTests >> testGetString [
	self assert: '89ea642f517dcb35f0d700efe29d741904d47d1a0aa4e441db479fc1e9f95fae' equals: (Keccak hashMessage: 'getString()')asByteArray hex
]

{ #category : #tests }
FogHashingCompatibilityTests >> testSetEnum [
	self assert: 'ec1dfc7b028538f2ec6b3e7d63100e75c370abd42b9fdfe9760d261e9ac3156f' equals: (Keccak hashMessage: 'setEnum(uint8)')asByteArray hex
]

{ #category : #tests }
FogHashingCompatibilityTests >> testSetNegativeInt [
	self assert: 'b3edd0eb351a56cf64c8c76e00cf5cc92b1bc8770a5aee308c30699fe1caff5a' equals: (Keccak hashMessage: 'setNegativeInt(int256)')asByteArray hex
]

{ #category : #tests }
FogHashingCompatibilityTests >> testSetPositiveInt [
	self assert: '7b65ec8af9d7a4e6073677a3dd0bc83a52bcb7f65478ce343738db427b06108b' equals: (Keccak hashMessage: 'setPositiveInt(int256)')asByteArray hex
]

{ #category : #tests }
FogHashingCompatibilityTests >> testSetSimpleArray [
	self assert: 'b1cce7209640ba436319fe7fc15c64da53923aae2d101b92e0cc6b981de62acc' equals: (Keccak hashMessage: 'setSimpleArray(int256[])')asByteArray hex
]

{ #category : #tests }
FogHashingCompatibilityTests >> testSetString [
	self assert: '7fcaf6661d59d1261d7d74068830b2e2b73988cdc7c14af3ab82282bb62a9288' equals: (Keccak hashMessage: 'setString(string)')asByteArray hex
]

{ #category : #tests }
FogHashingCompatibilityTests >> testSetTwoStrings [
	self assert: '82e361b7e81d96e351fe1fe328a5dc7c13e9a83a9b160ba41c0e4958a98f1611' equals: (Keccak hashMessage: 'setTwoStrings(string,string)')asByteArray hex
]

{ #category : #tests }
FogHashingCompatibilityTests >> testSetTwoStringsEnumInt [
	self assert: 'f3373137049661e08d0d23df06d30badfb531791427d872836cd3696a9316828' equals: (Keccak hashMessage: 'setTwoStringsEnumInt(string,uint8,int256,string)')asByteArray hex
]
