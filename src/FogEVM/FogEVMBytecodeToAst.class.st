Class {
	#name : #FogEVMBytecodeToAst,
	#superclass : #Object,
	#instVars : [
		'stack',
		'trace',
		'program',
		'instructionPointer',
		'scope',
		'instruction'
	],
	#category : 'FogEVM-Decompiler'
}

{ #category : #'as yet unclassified' }
FogEVMBytecodeToAst >> assignToTemporaryVariable: aNode [
	| var assignment |
	var := FogEVMAstVariable new.
	var createdAt: self currentInstruction. 
	self scope addTemporary: var.
	assignment := FogEVMAssignation new.
	assignment
		variable: var;
		value: aNode.
	self scope sequence addStatement: assignment.
	^ var
]

{ #category : #'as yet unclassified' }
FogEVMBytecodeToAst >> binaryMessageSend: selector receiver: receiver argument: argument [
	| messageSend variable  |
	messageSend := FogEVMAstBinaryMessageSend new.
	messageSend receiver: receiver.
	messageSend selector: selector.
	messageSend argument: argument.
	variable := self assignToTemporaryVariable: messageSend.
	^ variable
]

{ #category : #public }
FogEVMBytecodeToAst >> currentInstruction [
	^ instruction 
]

{ #category : #public }
FogEVMBytecodeToAst >> decompile: aFogEVMMnemonicContract [
	trace := OrderedCollection new.
	stack := Stack new.
	program := aFogEVMMnemonicContract content copy.
	instructionPointer := 1.
	self newScope. 
	[ self programHasFinished ]
		whileFalse: [ self fetchNextInstruction accept: self with: nil ]
]

{ #category : #public }
FogEVMBytecodeToAst >> fetchNextInstruction [

	instruction := program at: instructionPointer.
	trace add: instruction .
	instructionPointer := instructionPointer + 1.
	^ instruction
]

{ #category : #'as yet unclassified' }
FogEVMBytecodeToAst >> literalOrVariable: anObject [
	^ anObject isString
		ifTrue: [ FogEVMLiteral for: anObject ]
		ifFalse: [ (anObject isEVMLiteral or: [ anObject isEVMVariable ])
				ifTrue: [ anObject ]
				ifFalse: [ self halt: 'Should be string!' ] ]
]

{ #category : #'as yet unclassified' }
FogEVMBytecodeToAst >> memoryAccessfrom: from to: to [
	| node fromAddress toAddress |
	node := FogEVMAstMemoryLoad new.
	fromAddress := self literalOrVariable: from .
	toAddress := self literalOrVariable: to.
	node fromAddress: fromAddress.
	node amountOfBytes: toAddress.
	self scope sequence addStatement: node.
	^ self assignToTemporaryVariable: node
]

{ #category : #'as yet unclassified' }
FogEVMBytecodeToAst >> messageSend: selector receiver: receiver arguments: arguments [
	| messageSend variable  |
	messageSend := FogEVMAstMessageSend new.
	messageSend receiver: receiver.
	messageSend selector: selector.
	messageSend arguments: arguments.
	variable := self assignToTemporaryVariable: messageSend.
	^ variable
]

{ #category : #public }
FogEVMBytecodeToAst >> newScope [
	scope := FogEVMAstScope new
]

{ #category : #'as yet unclassified' }
FogEVMBytecodeToAst >> programHasFinished [
	^ instructionPointer > program size
]

{ #category : #public }
FogEVMBytecodeToAst >> scope [
	^ scope
]

{ #category : #'as yet unclassified' }
FogEVMBytecodeToAst >> specialVariableNamed: aName loadedWith: aNode [
	| variable |
	variable := self scope temporaries
		detect: [ :t | t name = aName ]
		ifNone: [ | var assign |
			var := FogEVMAstVariable new.
			var createdAt: self currentInstruction.
			var name: aName.
			assign := FogEVMAssignation new.
			assign variable: var.
			assign value: aNode.
			self scope addTemporary: var.
			self scope sequence addStatement: assign.
			var ].
	^ variable
]

{ #category : #utility }
FogEVMBytecodeToAst >> stackSize [
	^ stack size
]

{ #category : #visiting }
FogEVMBytecodeToAst >> visitAdd: aFogVMAdd [
	| variable |
	variable := self binaryMessageSend: #+ receiver: (self literalOrVariable: stack pop) argument: (self literalOrVariable: stack pop).
	stack push: variable
]

{ #category : #'as yet unclassified' }
FogEVMBytecodeToAst >> visitAnd: aFogVMAnd [
	| variable |
	variable := self binaryMessageSend: #& receiver: (self literalOrVariable: stack pop) argument: (self literalOrVariable: stack pop).
	stack push: variable
]

{ #category : #visiting }
FogEVMBytecodeToAst >> visitCalldataload: aFogVMCalldataload [
	| calldata var  atIndexMessageSend |
	calldata := self
		specialVariableNamed: #CALLDATA
		loadedWith: FogEVMAstCallData new.
	atIndexMessageSend := self
		messageSend: #at:
		receiver: calldata
		arguments: {(self literalOrVariable: stack pop)}.
	var := self assignToTemporaryVariable: atIndexMessageSend.
	stack push: var
]

{ #category : #visiting }
FogEVMBytecodeToAst >> visitCalldatasize: aFogVMCalldatasize [
	| variable |
	variable := self specialVariableNamed: #CALLDATASIZE loadedWith: FogEVMAstCallDataSize new.
	stack push: variable
]

{ #category : #'as yet unclassified' }
FogEVMBytecodeToAst >> visitCaller: aFogVMCaller [
	stack push: (self specialVariableNamed: #CALLER loadedWith: FogEVMAstCaller new)
]

{ #category : #visiting }
FogEVMBytecodeToAst >> visitCallvalue: aFogVMCallvalue [ 
	stack push: 6 asBKHexa .
	self visitCalldataload: aFogVMCallvalue.
]

{ #category : #visiting }
FogEVMBytecodeToAst >> visitCodecopy: aFogVMCodecopy [
	| codecopy |
	codecopy := FogEVMAstCodeCopy new.
	codecopy loadingArea: (self literalOrVariable: stack pop).
	codecopy fromInstruction: (self literalOrVariable: stack pop).
	codecopy amountOfInstructions: (self literalOrVariable: stack pop).
	self scope sequence addStatement: codecopy
]

{ #category : #visiting }
FogEVMBytecodeToAst >> visitDiv: aFogVMDiv [
	| variable |
	variable := self binaryMessageSend: #/ receiver: (self literalOrVariable: stack pop) argument: (self literalOrVariable: stack pop).
	stack push: variable 
]

{ #category : #visiting }
FogEVMBytecodeToAst >> visitDup: aFogVMDup [
	| element |
	element := stack at: aFogVMDup expectedPops.
	stack push: element 
]

{ #category : #visiting }
FogEVMBytecodeToAst >> visitEq: aFogVMEq [
	| variable |
	variable := self binaryMessageSend: #= receiver: (self literalOrVariable: stack pop) argument: (self literalOrVariable: stack pop).
	stack push: variable
]

{ #category : #'as yet unclassified' }
FogEVMBytecodeToAst >> visitExp: aFogVMExp [
	| variable |
	variable := self binaryMessageSend: #** receiver: (self literalOrVariable: stack pop) argument: (self literalOrVariable: stack pop).
	stack push: variable
]

{ #category : #'as yet unclassified' }
FogEVMBytecodeToAst >> visitGt: aFogVMGt [
	| variable |
	variable := self binaryMessageSend: #> receiver: (self literalOrVariable: stack pop) argument: (self literalOrVariable: stack pop).
	stack push: variable
]

{ #category : #visiting }
FogEVMBytecodeToAst >> visitIszero: aFogVMIszero [
	| variable |
	variable := self binaryMessageSend: #= receiver: stack pop argument: (FogEVMLiteral for: '0x0').
	stack push: variable
]

{ #category : #visiting }
FogEVMBytecodeToAst >> visitJump: aFogVMJump [
	| jump |
	jump := FogEVMAstJump new.
	jump address: stack pop.
	jump instruction: self currentInstruction.
	self scope sequence addStatement: jump
]

{ #category : #visiting }
FogEVMBytecodeToAst >> visitJumpdest: aFogVMJumpdest [
	| jumpTag |
	jumpTag := FogEVMAstJumpTag new.
	jumpTag address: self currentInstruction byteNumber.
	self scope sequence addStatement: jumpTag
]

{ #category : #visiting }
FogEVMBytecodeToAst >> visitJumpi: aFogVMJumpi [
	| conditionalJump |
	conditionalJump := FogEVMAstConditionalJump new.
	conditionalJump
		address: stack pop;
		condition: stack pop.
	self scope sequence addStatement: conditionalJump.
]

{ #category : #'as yet unclassified' }
FogEVMBytecodeToAst >> visitLt: aFogVMLt [ 
	| variable |
	variable := self binaryMessageSend: #< receiver: (self literalOrVariable: stack pop) argument: (self literalOrVariable: stack pop).
	stack push: variable
]

{ #category : #visiting }
FogEVMBytecodeToAst >> visitMload: aFogVMMload [
	| memoryLoadNode from amount var |
	memoryLoadNode := FogEVMAstMemoryLoad new.
	from := self literalOrVariable: stack pop.
	amount := self literalOrVariable: FogEVMInterpreter wordSize asBKHexa.
	memoryLoadNode fromAddress: from.
	memoryLoadNode amountOfBytes: amount.
	var := self assignToTemporaryVariable: memoryLoadNode.
	stack push: var
]

{ #category : #visiting }
FogEVMBytecodeToAst >> visitMstore: aFogVMMstore [
	| memoryStoreNode |
	memoryStoreNode := FogEVMAstMemoryStore new.
	memoryStoreNode address: stack pop.
	memoryStoreNode value: stack pop.
	self scope sequence addStatement: memoryStoreNode
]

{ #category : #'as yet unclassified' }
FogEVMBytecodeToAst >> visitMul: aFogVMMul [
	| variable |
	variable := self binaryMessageSend: #* receiver: (self literalOrVariable: stack pop) argument: (self literalOrVariable: stack pop).
	stack push: variable
]

{ #category : #'as yet unclassified' }
FogEVMBytecodeToAst >> visitNot: aFogVMNot [
	| variable |
	variable := self messageSend: #not receiver: (self literalOrVariable: stack pop) arguments: {}.
	stack push: variable
]

{ #category : #'as yet unclassified' }
FogEVMBytecodeToAst >> visitOr: aFogVMOr [
	| variable |
	variable := self binaryMessageSend: #'||' receiver: (self literalOrVariable: stack pop) argument: (self literalOrVariable: stack pop).
	stack push: variable
]

{ #category : #visiting }
FogEVMBytecodeToAst >> visitPop: aFogVMPop [
	"	| pop |
	pop := FogEVMAstPop new.
	pop variable: "

	stack pop
	"	self currentScope sequence addStatement: pop"
]

{ #category : #visiting }
FogEVMBytecodeToAst >> visitPush: aFogVMPush1 [
	| variable assignation literal |
	literal := self literalOrVariable: aFogVMPush1 parameter.
	variable := self assignToTemporaryVariable: literal.
	stack push: variable
]

{ #category : #visiting }
FogEVMBytecodeToAst >> visitReturn: aFogVMReturn [
	|  var return |
	var := self memoryAccessfrom: stack pop to: stack pop.
	return := FogEVMAstReturn new.
	return returns: var.
	self scope sequence addStatement: return.
	self scope finishesAt: self currentInstruction.

]

{ #category : #visiting }
FogEVMBytecodeToAst >> visitSelfdestruct: aFogVMSelfdestruct [
	| sd |
	sd := FogEVMAstSelfDestruct new.
	sd account: (self literalOrVariable: stack pop).
	sd instruction: self currentInstruction.
	self scope sequence addStatement: sd
]

{ #category : #'as yet unclassified' }
FogEVMBytecodeToAst >> visitSha3: aFogVMSha3 [
	| content result |
	content := self memoryAccessfrom: stack pop to: stack pop.
	result := self messageSend: #sha3 receiver: content arguments: {}.
	stack push: result
]

{ #category : #visiting }
FogEVMBytecodeToAst >> visitSload: aFogVMSload [
	| storageLoadNode from var |
	storageLoadNode := FogEVMAstStorageLoad new.
	from := self literalOrVariable: stack pop.
	storageLoadNode address: from.
	var := self assignToTemporaryVariable: storageLoadNode.
	stack push: var
]

{ #category : #'as yet unclassified' }
FogEVMBytecodeToAst >> visitSlt: aFogVMSlt [
	| variable |
	variable := self
		messageSend: #signedIsLesserThan:
		receiver: (self literalOrVariable: stack pop)
		arguments: {(self literalOrVariable: stack pop)}.
	stack push: variable
]

{ #category : #'as yet unclassified' }
FogEVMBytecodeToAst >> visitSstore: aFogVMSstore [
	| sStoreNode |
	sStoreNode := FogEVMAstStorageStore new.
	sStoreNode address: (self literalOrVariable: stack pop).
	sStoreNode value: (self literalOrVariable: stack pop).
	self scope sequence addStatement: sStoreNode
]

{ #category : #visiting }
FogEVMBytecodeToAst >> visitStop: aFogVMStop [
	| stop |
	stop := FogEVMAstStop new.
	stop address: self currentInstruction.
	self scope sequence addStatement: stop
]

{ #category : #visiting }
FogEVMBytecodeToAst >> visitSub: aFogVMSub [
	| variable |
	variable := self binaryMessageSend: #- receiver: (self literalOrVariable: stack pop) argument: (self literalOrVariable: stack pop).
	stack push: variable
]

{ #category : #visiting }
FogEVMBytecodeToAst >> visitSwap: aFogVMSwap [
	stack swap: 1 with: aFogVMSwap expectedPops + 1
]
