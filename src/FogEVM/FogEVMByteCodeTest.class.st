Class {
	#name : #FogEVMByteCodeTest,
	#superclass : #FogArbitraryAddressesTestCase,
	#instVars : [
		'contractDescription'
	],
	#category : 'FogEVM-ByteCode'
}

{ #category : #initialization }
FogEVMByteCodeTest >> setUp [
	super setUp.
	contractDescription := FogCache current detectFileContractDescriptionsOrNil: [ :a | a fromFile basename = 'public_3states_poll.sol' ]
]

{ #category : #initialization }
FogEVMByteCodeTest >> testBinaryByteCodeIsBinary [
	self assert: contractDescription mnemonicBinary isBinary 
]

{ #category : #initialization }
FogEVMByteCodeTest >> testBinaryByteCodeIsNotRuntime [
	self deny: contractDescription mnemonicBinary isRuntime  
]

{ #category : #initialization }
FogEVMByteCodeTest >> testBinaryCodeStreamConstructorHasMethodLookup [
	self assert: contractDescription mnemonicBinary readStream nextMethodLookup isNotEmpty
]

{ #category : #initialization }
FogEVMByteCodeTest >> testBinaryCodeStreamHasConstructor [
	self assert: contractDescription mnemonicBinary readStream nextConstructor isNotEmpty
]

{ #category : #initialization }
FogEVMByteCodeTest >> testBinaryNextMethodGivesAStream [
	| stream |
	stream := contractDescription mnemonicBinary readStream.
	stream nextConstructor.
	stream nextMethodLookup.
	self assert: (stream nextMethod isKindOf: FogEVMMethodBytecodeStream).
	
]

{ #category : #initialization }
FogEVMByteCodeTest >> testBinaryPollHas6Methods [
	| stream |
	stream := contractDescription mnemonicBinary readStream.
	stream nextConstructor. 
	stream nextMethodLookup.
	6 timesRepeat: [ stream nextMethod ].
	self should: [ stream nextMethod ] raise: Error
]

{ #category : #initialization }
FogEVMByteCodeTest >> testRuntimeByteCodeIsNotBinary [
	self deny: contractDescription mnemonicRuntime isBinary 
]

{ #category : #initialization }
FogEVMByteCodeTest >> testRuntimeByteCodeIsRuntime [
	self assert: contractDescription mnemonicRuntime isRuntime
]

{ #category : #initialization }
FogEVMByteCodeTest >> testRuntimeCodeStreamConstructorHasMethodLookup [
	self assert: contractDescription mnemonicRuntime readStream nextMethodLookup isNotEmpty
]

{ #category : #initialization }
FogEVMByteCodeTest >> testRuntimeCodeStreamConstructorRaisesException [ 
	self should: [ contractDescription mnemonicRuntime readStream nextConstructor   ] raise: Error 
]

{ #category : #initialization }
FogEVMByteCodeTest >> testRuntimeNextMethodGivesAStream [
	| stream |
	stream := contractDescription mnemonicRuntime readStream.
	stream nextMethodLookup.
	self assert: (stream nextMethod isKindOf: FogEVMMethodBytecodeStream)
]

{ #category : #initialization }
FogEVMByteCodeTest >> testRuntimePollHas6Methods [
	| stream |
	stream := contractDescription mnemonicRuntime readStream.
	stream nextMethodLookup.
	6 timesRepeat: [ stream nextMethod ].
	self should: [ stream nextMethod ] raise: Error
]
