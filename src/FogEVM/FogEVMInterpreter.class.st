"
This class is in charge of the implementation of the ByteCode interpretation .
"
Class {
	#name : #FogEVMInterpreter,
	#superclass : #Object,
	#instVars : [
		'stack',
		'memory',
		'call',
		'executableMemory',
		'instructionPointer',
		'programFinished',
		'storage',
		'program',
		'return',
		'trace'
	],
	#category : 'FogEVM-Interpreter'
}

{ #category : #test }
FogEVMInterpreter class >> exampleCall [
	^ {
	'0xc3c5a547000000000000000000000000b4ebf466889c4a0239379125a7d0f9c4e8bf2a14' . 
	3000000 asBKHexa.
	'contract-hash'.
	'0xb4ebf466889c4a0239379125a7d0f9c4e8bf2a14'.
	'0xcontract-address'.
	0.
	'?'.
	'?'.
	'?'.
	'?'}
	" (
            gas,
            value,
            to,
            sender,
            code_address,
            memory_input_start_position,
            memory_input_size,
            memory_output_start_position,
            memory_output_size,
            should_transfer_value,
        ) = self.get_call_params(computation)"
]

{ #category : #'as yet unclassified' }
FogEVMInterpreter class >> exampleCallFor: aDataContent [
	^ {aDataContent.
	3000000 asBKHexa.
	'contract-hash'.
	'0xb4ebf466889c4a0239379125a7d0f9c4e8bf2a14'.
	'0xcontract-address'.
	0.
	'?'.
	'?'.
	'?'.
	'?'}
	" (
            gas,
            value,
            to,
            sender,
            code_address,
            memory_input_start_position,
            memory_input_size,
            memory_output_start_position,
            memory_output_size,
            should_transfer_value,
        ) = self.get_call_params(computation)"
]

{ #category : #'as yet unclassified' }
FogEVMInterpreter class >> wordSize [
	^ 32
]

{ #category : #'as yet unclassified' }
FogEVMInterpreter >> accessCallFrom0BaseIndex: anInteger [
	^ call at: anInteger + 1
]

{ #category : #accessing }
FogEVMInterpreter >> binary [
	^ program toBinary
]

{ #category : #'as yet unclassified' }
FogEVMInterpreter >> booleanToHexa: aBoolean [
	^ (aBoolean
		ifTrue: [ 1 ]
		ifFalse: [ 0 ]) asBKHexa
]

{ #category : #'as yet unclassified' }
FogEVMInterpreter >> breakOnAddress: anAddress [
	^ (executableMemory at: (self indexForMemoryAddress: anAddress)) breakpoint: true.
]

{ #category : #accessing }
FogEVMInterpreter >> call: aCall [
	call := aCall
]

{ #category : #'as yet unclassified' }
FogEVMInterpreter >> callValue [
	^ call at: 6
]

{ #category : #'as yet unclassified' }
FogEVMInterpreter >> callerAddress [
	^ call at: 4
]

{ #category : #'as yet unclassified' }
FogEVMInterpreter >> cancelBreakOnAddress: anAddress [
	^ (executableMemory at: (self indexForMemoryAddress: anAddress)) breakpoint: false.
]

{ #category : #accessing }
FogEVMInterpreter >> contract: aFogEVMMnemonicContract [
	executableMemory := aFogEVMMnemonicContract sequence copy.
	executableMemory do: #initialize.
	program := aFogEVMMnemonicContract
]

{ #category : #'as yet unclassified' }
FogEVMInterpreter >> contractAddress [
	^ call at: 5
]

{ #category : #'as yet unclassified' }
FogEVMInterpreter >> fetchNextInstruction [
	| instruction |
	instruction := (executableMemory at: instructionPointer) .
	instructionPointer := instructionPointer + 1.
	^ instruction
]

{ #category : #'as yet unclassified' }
FogEVMInterpreter >> finishComputation [
	programFinished  := true. 
]

{ #category : #'as yet unclassified' }
FogEVMInterpreter >> hexa [
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
FogEVMInterpreter >> hexaToBoolean: anInteger [
	^ anInteger asBKNumber = 0
		ifTrue: [ false ]
		ifFalse: [ true ]
]

{ #category : #accessing }
FogEVMInterpreter >> indexForMemoryAddress: anAddress [
	^ executableMemory
		indexOf: (executableMemory detect: [ :i | i byteNumber = anAddress asBKNumber ])
]

{ #category : #initialization }
FogEVMInterpreter >> initialize [
	super initialize.
	stack := Stack new
]

{ #category : #'instruction decoding' }
FogEVMInterpreter >> interpret [
	| i |
	trace := OrderedCollection new.
	stack := Stack new.
	programFinished := false.
	self setInstructionPointerToByte: executableMemory first byteNumber.
	[ self programHasFinished ]
		whileFalse: [ "self haltIf: [ self peekNextNextInstruction isKindOf: FogVMSwap ]."
			i := self fetchNextInstruction.
			trace add: i.
			i accept: self with: nil ]
]

{ #category : #'as yet unclassified' }
FogEVMInterpreter >> keccack256: aString [
	^ Keccak hashEncode: aString 
]

{ #category : #accessing }
FogEVMInterpreter >> memory [
	^ memory ifNil: [ memory := FogEVMMemory new  ]
]

{ #category : #'as yet unclassified' }
FogEVMInterpreter >> peekInstruction: anAddress [
	^ (executableMemory at: (self indexForMemoryAddress: anAddress)) instruction
]

{ #category : #'as yet unclassified' }
FogEVMInterpreter >> peekNextInstruction [
	^ (executableMemory at: instructionPointer ) instruction
]

{ #category : #'as yet unclassified' }
FogEVMInterpreter >> peekNextNextInstruction [
	^ (executableMemory at: instructionPointer + 1) instruction
]

{ #category : #'as yet unclassified' }
FogEVMInterpreter >> programHasFinished [
	^ programFinished ifNil: [ programFinished := executableMemory size < instructionPointer ]
]

{ #category : #'as yet unclassified' }
FogEVMInterpreter >> runtimeState [
	" We should hash the states"
	^ 'latest'
]

{ #category : #'as yet unclassified' }
FogEVMInterpreter >> setInstructionPointerToByte: anInteger [
	instructionPointer := executableMemory indexOf: (executableMemory detect: [ :i | i byteNumber = anInteger asBKNumber ])
]

{ #category : #utility }
FogEVMInterpreter >> stackSize [
	^ stack size 
]

{ #category : #accessing }
FogEVMInterpreter >> storage [
	^ storage ifNil: [ storage := Dictionary new ]
]

{ #category : #'as yet unclassified' }
FogEVMInterpreter >> storageFor: anAddress [
	^ self storageFor: anAddress state: self runtimeState
]

{ #category : #'as yet unclassified' }
FogEVMInterpreter >> storageFor: aContractAddress state: aStateHash [ 
	self flag: #WeshouldCareAboutTheMerkelTreeState. 
	^ self storage at: aContractAddress ifAbsentPut: [ FogEVMBucketStorage new ].
]

{ #category : #'visit - arithmetics' }
FogEVMInterpreter >> visitAdd: aFogVMAdd [
	| a b |
	a := stack pop asBKNumber.
	b := stack pop asBKNumber.
	stack push: (a + b) asBKHexa
]

{ #category : #'visit - boolean alebra' }
FogEVMInterpreter >> visitAnd: aFogVMAnd [
	| a b |
	a := self hexaToBoolean: stack pop.
	b := self hexaToBoolean: stack pop.
	stack push: (self booleanToHexa: a & b)
]

{ #category : #'visit - call' }
FogEVMInterpreter >> visitCalldataload: aFogVMCalldataload [
	| id |
	id := stack pop asBKNumber.
	stack push: (self accessCallFrom0BaseIndex: id)
]

{ #category : #'visit - call' }
FogEVMInterpreter >> visitCalldatasize: aFogVMCalldatasize [ 
	stack push: call size asBKNumber
]

{ #category : #'visit - call' }
FogEVMInterpreter >> visitCaller: aFogVMCaller [ 
	stack push: self callerAddress
]

{ #category : #'visit - call' }
FogEVMInterpreter >> visitCallvalue: aFogVMCallvalue [
	stack push: self callValue
]

{ #category : #visiting }
FogEVMInterpreter >> visitCodecopy: aFogVMCodecopy [
	| loadingArea fromInstruction amountOfInstructions hexa |
	loadingArea := stack pop.
	fromInstruction := stack pop asBKNumber * 2 + 1.
	amountOfInstructions := stack pop asBKNumber * 2.
	hexa := program toHexa.
	hexa := hexa copyFrom: 3 to: hexa size.
	hexa := hexa copyFrom: fromInstruction to: fromInstruction + amountOfInstructions - 1.
	memory storeChunck: hexa startingAt: loadingArea ensureBytes: amountOfInstructions / 2
	"0 to: amountOfInstructions - 1 do: [ :i | memory store: (self hexa at: fromInstruction + i) at: (loadingArea + i) asBKHexa ]"
]

{ #category : #'visit - arithmetics' }
FogEVMInterpreter >> visitDiv: aFogVMDiv [
	| numerator denom |
	numerator := stack pop asBKNumber.
	denom := stack pop asBKNumber.
	stack
		push:
			(numerator isZero
				ifTrue: [ 0 ]
				ifFalse: [ numerator // denom ]) asBKHexa
]

{ #category : #'visit - stack' }
FogEVMInterpreter >> visitDup: aFogVMDup [
	| element | 
	element := stack at: aFogVMDup expectedPops.
	stack push: element copy
]

{ #category : #'visit - comparision' }
FogEVMInterpreter >> visitEq: aFogVMEq [
	| element1 element2 max |
	element1 := stack pop.
	element2 := stack pop.
	max := element1 size max: element2 size.
	element1 := element1 padRightTo: max with: $0.
	element2 := element2 padRightTo: max with: $0.
	stack
		push:
			(element1 = element2
				ifTrue: [ 1 ]
				ifFalse: [ 0 ]) asBKHexa
]

{ #category : #'visit - arithmetics' }
FogEVMInterpreter >> visitExp: aFogVMExp [
	| value exponent |
	value := stack pop asBKNumber.
	exponent := stack pop asBKNumber.
	stack push: (value ** exponent) asBKHexa
]

{ #category : #'visit - comparision' }
FogEVMInterpreter >> visitGt: aFogVMGt [
	| element1 element2 |
	element1 := stack pop asBKNumber.
	element2 := stack pop asBKNumber.
	stack
		push:
			(element1 > element2
				ifTrue: [ 1 ]
				ifFalse: [ 0 ]) asBKHexa
]

{ #category : #'visit - boolean alebra' }
FogEVMInterpreter >> visitIszero: aFogVMIszero [
	stack push: (self booleanToHexa: stack pop asBKNumber = 0)
]

{ #category : #'visit - flow' }
FogEVMInterpreter >> visitJump: aFogVMJump [
	| newInstructionPointer jumpDestInstruction |
	newInstructionPointer := stack pop.
	jumpDestInstruction := self peekInstruction: newInstructionPointer.
	self
		assert: jumpDestInstruction isValidJumpDestination
		description:
			('{1} is not a valid JUMP destination. {2} instruction founded'
				format:
					{newInstructionPointer.
					jumpDestInstruction}).
	self setInstructionPointerToByte: newInstructionPointer
]

{ #category : #'visit - flow' }
FogEVMInterpreter >> visitJumpdest: aFogVMJumpdest [ 
	" nothing to do here "
]

{ #category : #'visit - flow' }
FogEVMInterpreter >> visitJumpi: aFogVMJumpi [
	| condition newInstructionPointer jumpDestInstruction |
	newInstructionPointer := stack pop.
	jumpDestInstruction := self peekInstruction: newInstructionPointer.
	condition := self hexaToBoolean: stack pop.
	condition
		ifTrue: [ self
				assert: jumpDestInstruction isValidJumpDestination
				description:
					('{1} is not a valid JUMPI (Conditional JUMP) destination. {2} Instruction founded'
						format:
							{newInstructionPointer.
							jumpDestInstruction}).
			self setInstructionPointerToByte: newInstructionPointer ]
]

{ #category : #'visit - comparision' }
FogEVMInterpreter >> visitLt: aFogVMGt [
	| element1 element2 |
	element1 := stack pop asBKNumber.
	element2 := stack pop asBKNumber.
	stack
		push:
			(element1 < element2
				ifTrue: [ 1 ]
				ifFalse: [ 0 ]) asBKHexa
]

{ #category : #'as yet unclassified' }
FogEVMInterpreter >> visitMload: aFogVMMload [
	| fromAddress toAddress |
	fromAddress := stack pop.
	toAddress := (fromAddress asBKNumber + FogEVMInterpreter wordSize) asBKHexa.
	stack push: (memory fetchFrom: fromAddress to: toAddress)
]

{ #category : #'visit - memory' }
FogEVMInterpreter >> visitMstore: aFogVMMstore [ 
	| address value |
	address := stack pop.
	value := stack pop.
	self memory store: value at: address
]

{ #category : #'visit - arithmetics' }
FogEVMInterpreter >> visitMul: aFogVMMul [
	| numberA numberB |
	numberA := stack pop asBKNumber.
	numberB := stack pop asBKNumber.
	stack push: (numberA * numberB) asBKHexa
]

{ #category : #'visit - boolean alebra' }
FogEVMInterpreter >> visitNot: aFogVMNot [
	| value |
	value := self hexaToBoolean: stack pop.
	stack push: (self booleanToHexa: value not)
]

{ #category : #'visit - boolean alebra' }
FogEVMInterpreter >> visitOr: aFogVMOr [
	| a b |
	a := self hexaToBoolean: stack pop.
	b := self hexaToBoolean: stack pop.
	stack push: (self booleanToHexa: a | b)
]

{ #category : #'visit - stack' }
FogEVMInterpreter >> visitPop: aFogVMPop [
	stack pop
]

{ #category : #'visit - stack' }
FogEVMInterpreter >> visitPush: aFogVMPush [ 
	stack push: aFogVMPush pushable
]

{ #category : #'visit - flow' }
FogEVMInterpreter >> visitReturn: aFogVMReturn [
	| from to |
	from := stack pop.
	to := stack pop.
	return := memory fetchFrom: from to: to.
	self finishComputation
]

{ #category : #'visit - hashing' }
FogEVMInterpreter >> visitSha3: aFogVMSha3 [
	| fromAddress toAddress kck |
	fromAddress := stack pop.
	toAddress := stack pop.
	kck := self keccack256: (memory fetchFrom: fromAddress to: toAddress).
	stack push: kck.
]

{ #category : #'visit - storage' }
FogEVMInterpreter >> visitSload: aFogVMSload [ 
	| storageAddress value | 
	storageAddress := stack pop.
	value := (self storageFor: self contractAddress) getStorageAt: storageAddress. 
	stack push: value. 
]

{ #category : #'visit - comparision' }
FogEVMInterpreter >> visitSlt: aFogVMSlt [
	| element1 element2 pkr |
	pkr := FogHexadecimalPacker new.
	element1 := pkr unpackInt256: stack pop.
	element2 := pkr unpackInt256: stack pop.
	stack
		push:
			(element1 < element2
				ifTrue: [ 1 ]
				ifFalse: [ 0 ]) asBKHexa
]

{ #category : #'visit - storage' }
FogEVMInterpreter >> visitSstore: aFogVMSstore [
	| storageAddress value |
	storageAddress := stack pop.
	value := stack pop.
	value := (self storageFor: self contractAddress) atStorage: storageAddress put: value
]

{ #category : #'visit - arithmetics' }
FogEVMInterpreter >> visitSub: aFogVMAdd [
	| a b |
	a := stack pop asBKNumber.
	b := stack pop asBKNumber.
	stack push: (a - b) asBKHexa
]

{ #category : #'visit - stack' }
FogEVMInterpreter >> visitSwap: aFogVMSwap [
	stack swap: 1 with: aFogVMSwap expectedPops + 1
]
