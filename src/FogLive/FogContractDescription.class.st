"
Full contract ob ject. ABI + Binary + Runtime . Normally pointing a block chain deployed contract 
"
Class {
	#name : #FogContractDescription,
	#superclass : #Object,
	#instVars : [
		'binary',
		'runtime',
		'abi',
		'name',
		'mirror',
		'methods',
		'contract',
		'source',
		'package'
	],
	#category : #'FogLive-Meta-Description'
}

{ #category : #accessing }
FogContractDescription >> abi [
	^ abi
]

{ #category : #accessing }
FogContractDescription >> abi: aString [
	abi := aString
]

{ #category : #accessing }
FogContractDescription >> ast [
	| ast |
	ast := (package ast sourceunits select: #isContract)
		detect: [ :d | d identifier value value = name ].
	^ ast
]

{ #category : #accessing }
FogContractDescription >> at: anAddress [
	^ FogContractInstance new
		address: anAddress;
		contract: self;
		yourself
]

{ #category : #accessing }
FogContractDescription >> binary [
	^ binary
]

{ #category : #accessing }
FogContractDescription >> binary: aString [
	binary := aString asAddress
]

{ #category : #gttools }
FogContractDescription >> binaryHash [
	<doc: 'Returns the MD5 hash of the binary bytecode of the contract. This may be used for comparing descriptions'>
	^ (MD5 hashStream: binary asByteArray readStream) hex
]

{ #category : #testing }
FogContractDescription >> codeMatchesWith: aCode [
	| addCode |
	addCode := aCode asAddress.
	^ binary = addCode
		or: [ runtime isNotNil and: [ runtime = addCode or: [ (addCode size / (addCode minus: runtime) size) asFloat < self similarityThreshold ] ] ]
]

{ #category : #accessing }
FogContractDescription >> contract [
	<doc:
		'It returns a contract''s generated class, based on the ContractProxy generation. This generated class will provide transparent access to a remote contract '>
	^ self createContract
]

{ #category : #'contract generation' }
FogContractDescription >> createContract [
	^ FogContractProxyBuilder new description: self; createContractProxy 
]

{ #category : #testing }
FogContractDescription >> hasAbi [
	<doc: 'Informs if the ABI was provided during the creation of the contract description'>
	^ abi isNotNil
]

{ #category : #testing }
FogContractDescription >> hasAst [
	<doc: 'Informs if the AST (source code) was provided during the creation of the contract description'>
	^ package isNotNil and: [ package ast isNotNil ]
]

{ #category : #testing }
FogContractDescription >> hasBinary [
	<doc: 'Informs if the contract description counts with the binary representation (deployable bytecode)'>
	^ binary isNotNil
]

{ #category : #testing }
FogContractDescription >> hasRuntime [
	<doc: 'Informs if the contract description counts with the runtime representation (running deployed bytecode)'>
	^ runtime isNotNil
]

{ #category : #accessing }
FogContractDescription >> hasSource [
	<doc: 'Informs if the contract description counts with source code'>
	^ source isNotNil
]

{ #category : #gttools }
FogContractDescription >> inspect: bytecode on: composite title: title [
	^ composite table
		title: title;
		display: [ bytecode ];
		column: 'Address' evaluated: [ :e | e byteNumber asBKHexa: 5 ];
		column: 'Instruction' evaluated: #instruction;
		send: #value
]

{ #category : #gttools }
FogContractDescription >> inspectAbi: composite [
	<gtInspectorPresentationOrder: 5>
	composite text
		title: 'ABI ';
		display: [ self abi ]
]

{ #category : #gttools }
FogContractDescription >> inspectBinary: composite [
	<gtInspectorPresentationOrder: 6>
	(self respondsTo: #mnemonicBinary)
		ifTrue: [ self inspect: self mnemonicBinary content on: composite title: 'Binary Mnemonic' ]
		ifFalse: [ composite text
				title: 'Binary bytecode';
				display: [ self binary ] ]
]

{ #category : #gttools }
FogContractDescription >> inspectConstructor: composite [
	<gtInspectorPresentationOrder: 4>
	composite table
		title: 'Constructor';
		display: [ {self mirror constructor} ];
		column: 'Name' evaluated: #name;
		column: 'Selector' evaluated: #selector;
		column: 'Definition' evaluated: #value;
		send: #value
]

{ #category : #gttools }
FogContractDescription >> inspectMethods: composite [
	<gtInspectorPresentationOrder: 2>
	composite table
		title: 'Methods';
		display: [ self mirror instanceMirror methods ];
		column: 'Name' evaluated: #name;
		column: 'Selector' evaluated: #selector;
		column: 'Signature' evaluated: #signature;
		column: 'Definition' evaluated: #value;
		send: #value
]

{ #category : #gttools }
FogContractDescription >> inspectProperties: composite [
	<gtInspectorPresentationOrder: 3>
	composite table
		title: 'Properties';
		display: [ self mirror instanceMirror properties ];
		column: 'Name' evaluated: #name;
		column: 'Definition' evaluated: #value;
		send: #value
]

{ #category : #gttools }
FogContractDescription >> inspectRuntime: composite [
	<gtInspectorPresentationOrder: 7>
	(self respondsTo: #mnemonicRuntime)
		ifTrue: [ self mnemonicRuntime
				ifNotNil: [ :mnem | self inspect: mnem content on: composite title: 'Runtime Mnemonic' ] ]
		ifFalse: [ composite text
				title: 'Runtime bytecode';
				display: [ self runtime ] ]
]

{ #category : #gttools }
FogContractDescription >> inspectSource: composite [
	<gtInspectorPresentationOrder: 0>
	composite text
		title: 'Source';
		display: [ self source ]
]

{ #category : #gttools }
FogContractDescription >> inspectTypes: composite [
	<gtInspectorPresentationOrder: 1>
	composite table
		title: 'Types';
		display: [ self mirror types ];
		column: 'Name' evaluated: #name;
		column: 'Definition' evaluated: #value;
		send: #value
]

{ #category : #accessing }
FogContractDescription >> mirror [
	<doc: 'It returns a contract''s mirror generated by using the AST information. It requires to have an AST attached. It would fail if it does not have one.'>
	mirror := FogMirrorBuilder new
		ast: self ast;
		abi: abi;
		mirror.
	^ mirror
]

{ #category : #accessing }
FogContractDescription >> name [
	<doc: 'It returns the name of the contract'>
	^ name
]

{ #category : #accessing }
FogContractDescription >> name: aString [ 
	name := aString
]

{ #category : #accessing }
FogContractDescription >> package [
	<doc: 'It return''s the package to whom it belongs. (Fog adds the concept of package, that represent all the contracts belonging to the same file)'>
	^ package
]

{ #category : #accessing }
FogContractDescription >> package: aPackage [
	package := aPackage
]

{ #category : #printing }
FogContractDescription >> printOn: aStream [
	^ aStream
		nextPutAll: 'Contract ';
		nextPutAll: (name ifNil: [ 'Unknown' ])
]

{ #category : #'cache polimorfism' }
FogContractDescription >> privateAddress [
	^ self hash 
]

{ #category : #accessing }
FogContractDescription >> reference [
	<doc: 'It returns the reference as the way to point to this contract description in this session.'>
	^ package reference / name asSymbol
]

{ #category : #accessing }
FogContractDescription >> runtime [
	^ runtime
]

{ #category : #accessing }
FogContractDescription >> runtime: aString [
	runtime := aString asAddress
]

{ #category : #gttools }
FogContractDescription >> runtimeHash [
	^ (MD5 hashStream: runtime asByteArray readStream) hex
]

{ #category : #'as yet unclassified' }
FogContractDescription >> similarityThreshold [
	^ 0
]

{ #category : #accessing }
FogContractDescription >> source [
	<doc: 'Returns the source code (or nil if it does not have it)'>
	^ package source 
]

{ #category : #accessing }
FogContractDescription >> types [
	<doc: 'It returns all the types used inside the ast of the contract'>
	^ self ast types
]

{ #category : #accessing }
FogContractDescription >> versionHash [
	<doc: 'It generate a version number based on the hash of the runtime bytecode, the binary bytecode and the source code'>
	^ '.'
		join:
			{(runtime ifNotNil: [ self runtime hash ] ifNil: [ 0 ]).
			(binary ifNotNil: [ self binary hash ] ifNil: [ 0 ]).
			(self hasSource
				ifTrue: [ self source hash ]
				ifFalse: [ 0 ])}
]
