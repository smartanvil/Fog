Class {
	#name : #FogEVMDecompiler,
	#superclass : #Object,
	#instVars : [
		'stack',
		'trace',
		'program',
		'scopes',
		'instructionPointer',
		'i',
		'currentScope',
		'extractedMethods'
	],
	#category : 'FogEVM-Decompiler'
}

{ #category : #'as yet unclassified' }
FogEVMDecompiler >> assignToTemporaryVariable: aNode [
	| var assignment |
	var := FogEVMAstVariable new.
	var createdAt: i.
	self currentScope addTemporary: var.
	assignment := FogEVMAssignation new.
	assignment
		variable: var;
		value: aNode.
	self currentScope sequence addStatement: assignment.
	^ var
]

{ #category : #'as yet unclassified' }
FogEVMDecompiler >> binaryMessageSend: selector receiver: receiver argument: argument [
	| messageSend variable  |
	messageSend := FogEVMAstBinaryMessageSend new.
	messageSend receiver: receiver.
	messageSend selector: selector.
	messageSend argument: argument.
	variable := self assignToTemporaryVariable: messageSend.
	^ variable
]

{ #category : #'as yet unclassified' }
FogEVMDecompiler >> cleanOneReadOneWriteVariables [
	| modifications wiper |
	modifications := true.
	[ modifications ]
		whileTrue: [ wiper := FogEVMAstVariableWiperVisitor new.
			scopes keys asSortedCollection
				do: [ :k | (scopes at: k) accept: wiper ].
			wiper wipe.
			modifications := wiper anyScopeHasChanged ].
	wiper := FogEVMAstVariableWiperVisitor new.
	scopes keys asSortedCollection
		do: [ :k | (scopes at: k) accept: wiper ].
	wiper wipe.
	wiper := FogEVMAstVariableWiperVisitor new.
	scopes keys asSortedCollection
		do: [ :k | (scopes at: k) accept: wiper ].
	wiper wipe
]

{ #category : #public }
FogEVMDecompiler >> currentScope [
	^ currentScope
]

{ #category : #public }
FogEVMDecompiler >> decompile: aFogEVMMnemonicContract [
	| mainScope |
	trace := OrderedCollection new.
	stack := Stack new.
	program := aFogEVMMnemonicContract content copy.
	scopes := Dictionary new.
	instructionPointer := 1.
	self newScopeWithID: 0.
	mainScope := self scopeID: 0.
	[ self programHasFinished ]
		whileFalse: [ "self haltIf: [ self peekNextNextInstruction isKindOf: FogVMSwap ]."
			i := self fetchNextInstruction.
			trace add: i.
			i accept: self with: nil ].
	self cleanOneReadOneWriteVariables.
	self extractScopes.
"	self cleanOneReadOneWriteVariables"
]

{ #category : #'as yet unclassified' }
FogEVMDecompiler >> extractScopes [
	| scoper newScopes |
	scoper := FogEVMAstScoper new.
	scoper scope: currentScope.
	extractedMethods := scoper methods 
]

{ #category : #'as yet unclassified' }
FogEVMDecompiler >> extractedMethods [
	^ extractedMethods
]

{ #category : #public }
FogEVMDecompiler >> fetchNextInstruction [
	| instruction |
	instruction := program at: instructionPointer.
	instructionPointer := instructionPointer + 1.
	^ instruction
]

{ #category : #'as yet unclassified' }
FogEVMDecompiler >> linkScopes [
	scopes do: [ : s | s linkJumpsTo: scopes ] 
]

{ #category : #'as yet unclassified' }
FogEVMDecompiler >> literalOrVariable: anObject [
	^ anObject isString
		ifTrue: [ FogEVMLiteral for: anObject ]
		ifFalse: [ (anObject isEVMLiteral or: [ anObject isEVMVariable ])
				ifTrue: [ anObject ]
				ifFalse: [ self halt: 'Should be string!' ] ]
]

{ #category : #'as yet unclassified' }
FogEVMDecompiler >> memoryAccessfrom: from to: to [
	| node fromAddress toAddress |
	node := FogEVMAstMemoryLoad new.
	fromAddress := self literalOrVariable: from .
	toAddress := self literalOrVariable: to.
	node fromAddress: fromAddress.
	node amountOfBytes: toAddress.
	self currentScope sequence addStatement: node.
	^ self assignToTemporaryVariable: node
]

{ #category : #'as yet unclassified' }
FogEVMDecompiler >> messageSend: selector receiver: receiver arguments: arguments [
	| messageSend variable  |
	messageSend := FogEVMAstMessageSend new.
	messageSend receiver: receiver.
	messageSend selector: selector.
	messageSend arguments: arguments.
	variable := self assignToTemporaryVariable: messageSend.
	^ variable
]

{ #category : #public }
FogEVMDecompiler >> newScopeWithID: anID [
	anID = 0
		ifTrue: [ currentScope := FogEVMAstScope new
				id: anID;
				yourself.
			scopes at: anID put: currentScope ]
]

{ #category : #'as yet unclassified' }
FogEVMDecompiler >> programHasFinished [
	^ instructionPointer > program size
]

{ #category : #public }
FogEVMDecompiler >> scopeID: anID [
	^ scopes at: anID
]

{ #category : #'as yet unclassified' }
FogEVMDecompiler >> specialVariableNamed: aName loadedWith: aNode [
	| variable |
	variable := self currentScope temporaries
		detect: [ :t | t name = aName ]
		ifNone: [ | var assign |
			var := FogEVMAstVariable new.
			var createdAt: i.
			var name: aName.
			assign := FogEVMAssignation new.
			assign variable: var.
			assign value: aNode.
			self currentScope addTemporary: var.
			self currentScope sequence addStatement: assign.
			var ].
	^ variable
]

{ #category : #utility }
FogEVMDecompiler >> stackSize [
	^ stack size
]

{ #category : #visiting }
FogEVMDecompiler >> visitAdd: aFogVMAdd [
	| variable |
	variable := self binaryMessageSend: #+ receiver: (self literalOrVariable: stack pop) argument: (self literalOrVariable: stack pop).
	stack push: variable
]

{ #category : #'as yet unclassified' }
FogEVMDecompiler >> visitAnd: aFogVMAnd [
	| variable |
	variable := self binaryMessageSend: #& receiver: (self literalOrVariable: stack pop) argument: (self literalOrVariable: stack pop).
	stack push: variable
]

{ #category : #visiting }
FogEVMDecompiler >> visitCalldataload: aFogVMCalldataload [
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
FogEVMDecompiler >> visitCalldatasize: aFogVMCalldatasize [
	| variable |
	variable := self specialVariableNamed: #CALLDATASIZE loadedWith: FogEVMAstCallDataSize new.
	stack push: variable
]

{ #category : #'as yet unclassified' }
FogEVMDecompiler >> visitCaller: aFogVMCaller [
	stack push: (self specialVariableNamed: #CALLER loadedWith: FogEVMAstCaller new)
]

{ #category : #visiting }
FogEVMDecompiler >> visitCallvalue: aFogVMCallvalue [ 
	stack push: 6 asBKHexa .
	self visitCalldataload: aFogVMCallvalue.
]

{ #category : #visiting }
FogEVMDecompiler >> visitCodecopy: aFogVMCodecopy [
	| codecopy |
	codecopy := FogEVMAstCodeCopy new.
	codecopy loadingArea: (self literalOrVariable: stack pop).
	codecopy fromInstruction: (self literalOrVariable: stack pop).
	codecopy amountOfInstructions: (self literalOrVariable: stack pop).
	self currentScope sequence addStatement: codecopy
]

{ #category : #visiting }
FogEVMDecompiler >> visitDiv: aFogVMDiv [
	| variable |
	variable := self binaryMessageSend: #/ receiver: (self literalOrVariable: stack pop) argument: (self literalOrVariable: stack pop).
	stack push: variable 
]

{ #category : #visiting }
FogEVMDecompiler >> visitDup: aFogVMDup [
	| element |
	element := stack at: aFogVMDup expectedPops.
	stack push: element 
]

{ #category : #visiting }
FogEVMDecompiler >> visitEq: aFogVMEq [
	| variable |
	variable := self binaryMessageSend: #= receiver: (self literalOrVariable: stack pop) argument: (self literalOrVariable: stack pop).
	stack push: variable
]

{ #category : #'as yet unclassified' }
FogEVMDecompiler >> visitExp: aFogVMExp [
	| variable |
	variable := self binaryMessageSend: #** receiver: (self literalOrVariable: stack pop) argument: (self literalOrVariable: stack pop).
	stack push: variable
]

{ #category : #'as yet unclassified' }
FogEVMDecompiler >> visitGt: aFogVMGt [
	| variable |
	variable := self binaryMessageSend: #> receiver: (self literalOrVariable: stack pop) argument: (self literalOrVariable: stack pop).
	stack push: variable
]

{ #category : #visiting }
FogEVMDecompiler >> visitIszero: aFogVMIszero [
	| variable |
	variable := self binaryMessageSend: #= receiver: stack pop argument: (FogEVMLiteral for: '0x0').
	stack push: variable
]

{ #category : #visiting }
FogEVMDecompiler >> visitJump: aFogVMJump [
	| jump |
	jump := FogEVMAstJump new.
	jump address: stack pop.
	jump instruction: i.
	self currentScope sequence addStatement: jump
]

{ #category : #visiting }
FogEVMDecompiler >> visitJumpdest: aFogVMJumpdest [
	| jumpTag |
	jumpTag := FogEVMAstJumpTag new.
	jumpTag address: i byteNumber.
	self currentScope sequence addStatement: jumpTag
]

{ #category : #visiting }
FogEVMDecompiler >> visitJumpi: aFogVMJumpi [
	| conditionalJump |
	conditionalJump := FogEVMAstConditionalJump new.
	conditionalJump
		address: stack pop;
		condition: stack pop.
	self currentScope sequence addStatement: conditionalJump.
]

{ #category : #'as yet unclassified' }
FogEVMDecompiler >> visitLt: aFogVMLt [ 
	| variable |
	variable := self binaryMessageSend: #< receiver: (self literalOrVariable: stack pop) argument: (self literalOrVariable: stack pop).
	stack push: variable
]

{ #category : #visiting }
FogEVMDecompiler >> visitMload: aFogVMMload [
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
FogEVMDecompiler >> visitMstore: aFogVMMstore [
	| memoryStoreNode |
	memoryStoreNode := FogEVMAstMemoryStore new.
	memoryStoreNode address: stack pop.
	memoryStoreNode value: stack pop.
	self currentScope sequence addStatement: memoryStoreNode
]

{ #category : #'as yet unclassified' }
FogEVMDecompiler >> visitMul: aFogVMMul [
	| variable |
	variable := self binaryMessageSend: #* receiver: (self literalOrVariable: stack pop) argument: (self literalOrVariable: stack pop).
	stack push: variable
]

{ #category : #'as yet unclassified' }
FogEVMDecompiler >> visitNot: aFogVMNot [
	| variable |
	variable := self messageSend: #not receiver: (self literalOrVariable: stack pop) arguments: {}.
	stack push: variable
]

{ #category : #'as yet unclassified' }
FogEVMDecompiler >> visitOr: aFogVMOr [
	| variable |
	variable := self binaryMessageSend: #'||' receiver: (self literalOrVariable: stack pop) argument: (self literalOrVariable: stack pop).
	stack push: variable
]

{ #category : #visiting }
FogEVMDecompiler >> visitPop: aFogVMPop [
	"	| pop |
	pop := FogEVMAstPop new.
	pop variable: "

	stack pop
	"	self currentScope sequence addStatement: pop"
]

{ #category : #visiting }
FogEVMDecompiler >> visitPush: aFogVMPush1 [
	| variable assignation literal |
	literal := self literalOrVariable: aFogVMPush1 parameter.
	variable := self assignToTemporaryVariable: literal.
	stack push: variable
]

{ #category : #visiting }
FogEVMDecompiler >> visitReturn: aFogVMReturn [
	|  var return |
	var := self memoryAccessfrom: stack pop to: stack pop.
	return := FogEVMAstReturn new.
	return returns: var.
	self currentScope sequence addStatement: return.
	self currentScope finishesAt: i.
	self newScopeWithID: instructionPointer
]

{ #category : #visiting }
FogEVMDecompiler >> visitSelfdestruct: aFogVMSelfdestruct [
	| sd |
	sd := FogEVMAstSelfDestruct new.
	sd account: (self literalOrVariable: stack pop).
	sd instruction: i.
	self currentScope sequence addStatement: sd
]

{ #category : #'as yet unclassified' }
FogEVMDecompiler >> visitSha3: aFogVMSha3 [
	| content result |
	content := self memoryAccessfrom: stack pop to: stack pop.
	result := self messageSend: #sha3 receiver: content arguments: {}.
	stack push: result
]

{ #category : #visiting }
FogEVMDecompiler >> visitSload: aFogVMSload [
	| storageLoadNode from var |
	storageLoadNode := FogEVMAstStorageLoad new.
	from := self literalOrVariable: stack pop.
	storageLoadNode address: from.
	var := self assignToTemporaryVariable: storageLoadNode.
	stack push: var
]

{ #category : #'as yet unclassified' }
FogEVMDecompiler >> visitSlt: aFogVMSlt [
	| variable |
	variable := self
		messageSend: #signedIsLesserThan:
		receiver: (self literalOrVariable: stack pop)
		arguments: {(self literalOrVariable: stack pop)}.
	stack push: variable
]

{ #category : #'as yet unclassified' }
FogEVMDecompiler >> visitSstore: aFogVMSstore [
	| sStoreNode |
	sStoreNode := FogEVMAstStorageStore new.
	sStoreNode address: (self literalOrVariable: stack pop).
	sStoreNode value: (self literalOrVariable: stack pop).
	self currentScope sequence addStatement: sStoreNode
]

{ #category : #visiting }
FogEVMDecompiler >> visitStop: aFogVMStop [
	| stop |
	stop := FogEVMAstStop new.
	stop address:  i.
	self currentScope sequence addStatement: stop
]

{ #category : #visiting }
FogEVMDecompiler >> visitSub: aFogVMSub [
	| variable |
	variable := self binaryMessageSend: #- receiver: (self literalOrVariable: stack pop) argument: (self literalOrVariable: stack pop).
	stack push: variable
]

{ #category : #visiting }
FogEVMDecompiler >> visitSwap: aFogVMSwap [
	stack swap: 1 with: aFogVMSwap expectedPops + 1
]
