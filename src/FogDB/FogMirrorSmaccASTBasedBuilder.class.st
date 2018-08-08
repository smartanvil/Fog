"
This visitor is in charge of build a contract mirror based on a SmaccSolidity AST 
"
Class {
	#name : #FogMirrorSmaccASTBasedBuilder,
	#superclass : #Object,
	#instVars : [
		'contractSlots',
		'types',
		'variableSlots',
		'mirror',
		'methods',
		'constructor'
	],
	#category : 'FogDB-Meta-Mirror'
}

{ #category : #'as yet unclassified' }
FogMirrorSmaccASTBasedBuilder >> buildInto: aFogContractMirror [ 
	aFogContractMirror types: types.
	aFogContractMirror instanceMirror properties: contractSlots.
	aFogContractMirror instanceMirror methods: methods.
	aFogContractMirror constructor: constructor.
]

{ #category : #'as yet unclassified' }
FogMirrorSmaccASTBasedBuilder >> createConstructor: aSolFunctionDefinitionNode [
	| input parameters |
	input := aSolFunctionDefinitionNode parameters parameters collect: [ :p | self halt ].

	"
	 identifierTokens with: aSolFunctionDefinitionNode param_list types collect: [ :name :type | name -> (types at: type) ]."
	parameters := FogTupleType new
		types: input;
		yourself.
	^ FogConstructorMirror new
		name: #constructor;
		parameters: parameters;
		yourself
]

{ #category : #'as yet unclassified' }
FogMirrorSmaccASTBasedBuilder >> createMethod: aSolFunctionDefinitionNode [
	| input output return parameters |
	input := aSolFunctionDefinitionNode parameters parameters collect: [ :p | (p identifier acceptVisitor: self) -> (types at: p type) ].
	output := aSolFunctionDefinitionNode returned_types
		ifNotNil: [ aSolFunctionDefinitionNode returned_types parameters
				collect: [ :p | (p identifier ifNil: [ #return ] ifNotNil: [ :i | i acceptVisitor: self ]) -> (types at: p type) ] ]
		ifNil: [ {} ].
	return := output size > 1
		ifTrue: [ FogTupleType new
				types: output;
				yourself ]
		ifFalse: [ output ifEmpty: [ FogTypeEmpty new ] ifNotEmpty: [ (output at: 1) value ] ].
	parameters := FogTupleType new
		types: input;
		yourself.
	^ FogMethodMirror new
		name: (aSolFunctionDefinitionNode identifier acceptVisitor: self);
		parameters: parameters;
		return: return;
		modifiesState: aSolFunctionDefinitionNode isConstant not;
		yourself
]

{ #category : #initialization }
FogMirrorSmaccASTBasedBuilder >> initialize [
	super initialize.
	types := Dictionary new.
	variableSlots := OrderedCollection new.
	contractSlots := OrderedCollection new.
	methods := OrderedCollection new
]

{ #category : #'as yet unclassified' }
FogMirrorSmaccASTBasedBuilder >> visitArrayTypeName: aSolArrayTypeNameNode [ 
	| inner |
	aSolArrayTypeNameNode type acceptVisitor: self.
	inner := types at: aSolArrayTypeNameNode type .
	types
		at: aSolArrayTypeNameNode
		put:
			(FogArrayType new
				inner: inner;
				yourself)
]

{ #category : #visiting }
FogMirrorSmaccASTBasedBuilder >> visitConstantDeclaration: aSolConstantDeclarationNode [
	| slot |
	aSolConstantDeclarationNode type acceptVisitor: self.
	slot := FogConstantMirror new
		name: aSolConstantDeclarationNode identifierToken value;
		type: (types at: aSolConstantDeclarationNode type);
		constant: aSolConstantDeclarationNode constantToken value.
	contractSlots add: slot.
]

{ #category : #visiting }
FogMirrorSmaccASTBasedBuilder >> visitContractDefinition: aSolContractDefinitionNode [
	aSolContractDefinitionNode statements do: [ :cs | cs acceptVisitor: self ]
]

{ #category : #'as yet unclassified' }
FogMirrorSmaccASTBasedBuilder >> visitElementaryTypeName: aSolElementaryTypeNameNode [
	| type symbol |
	symbol := aSolElementaryTypeNameNode type acceptVisitor: self.
	type := symbol = #string
		ifTrue: [ FogStringType new ]
		ifFalse: [ FogSimpleType new
				name: symbol;
				yourself ].
	types at: aSolElementaryTypeNameNode ifAbsentPut: [ type ]
]

{ #category : #'as yet unclassified' }
FogMirrorSmaccASTBasedBuilder >> visitEnumDefinition: aSolEnumDefinitionNode [ 
	^ types
		at: aSolEnumDefinitionNode
		put:
			(FogEnumType new
				values: (aSolEnumDefinitionNode values acceptVisitor: self);
				yourself)
]

{ #category : #visiting }
FogMirrorSmaccASTBasedBuilder >> visitEventDefinition: aSolEventDefinitionNode [ 
	| event | 
	event := FogEventMirror new .
	aSolEventDefinitionNode indexed_param_list acceptVisitor: self. 
	
	event name: 	aSolEventDefinitionNode event_id value .
	
	event.
	self events add: event. 
]

{ #category : #'as yet unclassified' }
FogMirrorSmaccASTBasedBuilder >> visitFallbackFunctionDefinition: aSolFallbackFunctionDefinitionNode [ 
	"self shouldBeImplemented."
]

{ #category : #'as yet unclassified' }
FogMirrorSmaccASTBasedBuilder >> visitFunctionDefinition: aSolFunctionDefinitionNode [
	aSolFunctionDefinitionNode parameters parameters do: [ :t | t acceptVisitor: self ].
	aSolFunctionDefinitionNode returned_types ifNotNil: [ :ret | ret parameters do: [ :t | t acceptVisitor: self ] ].
	aSolFunctionDefinitionNode isConstructor
		ifTrue: [ constructor := self createConstructor: aSolFunctionDefinitionNode ]
		ifFalse: [ methods add: (self createMethod: aSolFunctionDefinitionNode) ]
]

{ #category : #visitign }
FogMirrorSmaccASTBasedBuilder >> visitLiteralIdentifier: aSolLiteralIdentifierNode [
	^ aSolLiteralIdentifierNode value value asSymbol
]

{ #category : #'as yet unclassified' }
FogMirrorSmaccASTBasedBuilder >> visitMappingTypeName: aSolMappingTypeNameNode [
	| key value |
	aSolMappingTypeNameNode key_type acceptVisitor: self.
	aSolMappingTypeNameNode value_type  acceptVisitor: self.
	key := types at: aSolMappingTypeNameNode key_type.
	value := types at: aSolMappingTypeNameNode value_type.
	types
		at: aSolMappingTypeNameNode
		put:
			(FogMappingType new
				keyType: key;
				valueType: value)
]

{ #category : #visiting }
FogMirrorSmaccASTBasedBuilder >> visitModifierDefinition: aSolModifierDefinitionNode [ 

]

{ #category : #visiting }
FogMirrorSmaccASTBasedBuilder >> visitParameter: aSolParameterNode [ 
	aSolParameterNode type acceptVisitor: self 
]

{ #category : #viisting }
FogMirrorSmaccASTBasedBuilder >> visitPragmaDirective: aSolPragmaDirectiveNode [ 
	" nothing to do here yet "
]

{ #category : #visiting }
FogMirrorSmaccASTBasedBuilder >> visitRootSource: aSolRootSourceNode [
	aSolRootSourceNode sourceunits acceptVisitor: self
]

{ #category : #'as yet unclassified' }
FogMirrorSmaccASTBasedBuilder >> visitStateVariableDeclaration: aSolStateVariableDeclarationNode [
	| slot |
	aSolStateVariableDeclarationNode type acceptVisitor: self.
	slot := FogPropertyMirror new
		name: (aSolStateVariableDeclarationNode identifier acceptVisitor: self );
		type: (types at: aSolStateVariableDeclarationNode type).
	variableSlots add: slot.
	slot id: (variableSlots indexOf: slot) - 1.
	contractSlots add: slot
]

{ #category : #'as yet unclassified' }
FogMirrorSmaccASTBasedBuilder >> visitStructDefinition: aSolStructDefinitionNode [ 
	^ types
		at: aSolStructDefinitionNode
		put:
			(FogStructType new
				fields:
					(aSolStructDefinitionNode fields 
						collect: [ :f | 
							f type acceptVisitor: self.
							FogStructField new
								name: (f identifier acceptVisitor:self);
								type: (types at: f type);
								yourself ]);
				yourself)
]

{ #category : #'as yet unclassified' }
FogMirrorSmaccASTBasedBuilder >> visitUserDefinedTypeName: aSolUserDefinedTypeNameNode [
	| keyToDefinedType |
	keyToDefinedType := (types keys select: [ :t | t isUserDefined ])
		detect: [ :k | k identifier value = aSolUserDefinedTypeNameNode value value ].
	types at: aSolUserDefinedTypeNameNode put: (types at: keyToDefinedType)
]
