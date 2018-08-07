"
Assembly bytecode 
"
Class {
	#name : #FogEVMByteCode,
	#superclass : #Object,
	#instVars : [
		'content'
	],
	#category : 'FogEVM-ByteCode'
}

{ #category : #'instance creation' }
FogEVMByteCode class >> fromBinary: anHexaContent [
	| stream result |
	stream := (anHexaContent copyReplaceAll: '0x' with: '') readStream.
	result := OrderedCollection new.
	[ stream atEnd ]
		whileFalse: [ | instruction byteLocation |
			byteLocation := stream position / 2.
			instruction := self instructionFor: (stream next: 2).
			instruction loadParametersFrom: stream.
			result
				add:
					(FogEVMMnemonicExecutableMemoryEntry new
						byteNumber: byteLocation;
						instruction: instruction) ].
	^ self new
		content: result;
		yourself
]

{ #category : #private }
FogEVMByteCode class >> instructionFor: aCode [
	| code |
	code := '0x' , aCode.
	^ (FogEVMInstruction allSubclasses detect: [ :c | c byteCode = code ] ifNone:[ FogEVMUnknown ]) instance
]

{ #category : #converting }
FogEVMByteCode >> accept: anInterpreter [
	^ content do: [ :e | e accept: anInterpreter with: content ]
]

{ #category : #accessing }
FogEVMByteCode >> content [
	^ content
]

{ #category : #accessing }
FogEVMByteCode >> content: aCollection [
	content := aCollection
]

{ #category : #converting }
FogEVMByteCode >> hasConstructor [
	| copyCodes shouldByPush10x0 shouldBeReturn |
	copyCodes := content select: [ :i | i instruction isCopyCode ].
	copyCodes isEmpty
		ifTrue: [ ^ false ].
	self assert: copyCodes size = 1.
	shouldByPush10x0 := (content indexOf: (copyCodes at: 1)) + 1.
	shouldBeReturn := shouldByPush10x0 + 1.
	^ (content at: shouldByPush10x0) instruction = FogVMPush1 instance0x00
		and: [ (content at: shouldBeReturn) instruction = FogVMReturn instance ]
]

{ #category : #converting }
FogEVMByteCode >> isBinary [ 
	^ self hasConstructor 
]

{ #category : #converting }
FogEVMByteCode >> isNotEmpty [
	^ content isNotEmpty 
]

{ #category : #converting }
FogEVMByteCode >> isRuntime [
	^ self hasConstructor not
]

{ #category : #converting }
FogEVMByteCode >> printOn: aStream [
	content printOn: aStream
]

{ #category : #converting }
FogEVMByteCode >> readStream [
	^ FogEVMByteCodeStream on: content
]

{ #category : #converting }
FogEVMByteCode >> toBinary [
	^ '0x'
		,
			((content collect: #instruction)
				inject: OrderedCollection new  writeStream
				into: [ :acc :each | 
					each printBinaryOn: acc.
					acc ]) contents asByteArray 
]

{ #category : #converting }
FogEVMByteCode >> toHexa [
	^ '0x'
		,
			((content collect: #instruction)
				inject: '' writeStream
				into: [ :acc :each | 
					each printHexaOn: acc.
					acc ]) contents
]
