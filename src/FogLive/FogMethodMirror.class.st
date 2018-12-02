"
Method reification for method call. 
"
Class {
	#name : #FogMethodMirror,
	#superclass : #Object,
	#instVars : [
		'modifiesState',
		'name',
		'parameters',
		'return'
	],
	#category : 'FogLive-Meta-Mirror'
}

{ #category : #accessing }
FogMethodMirror >> baseName [
	^ name 
]

{ #category : #'as yet unclassified' }
FogMethodMirror >> encodeUsing: aSession for: aContractDescription with: anCollectionOfArgs [
	^ aSession privateEncode: self arguments: anCollectionOfArgs
]

{ #category : #'as yet unclassified' }
FogMethodMirror >> hasParameters [
	<doc: 'Returns true if it has parameters. False if it does not expect any parameter'>
	^ parameters size > 0
]

{ #category : #testing }
FogMethodMirror >> isStateModifier [
	<doc: 'Returns true the method is supposed to modify state on call'>
	^ modifiesState
]

{ #category : #accessing }
FogMethodMirror >> modifiesState: aFalse [  
	modifiesState := aFalse
]

{ #category : #accessing }
FogMethodMirror >> name [
	<doc: 'Returns the method''s name'>
	^ '{1}({2}) returns ({3})'
		format:
			{name.
			(',' join: (parameters types collect: [ :p | p name])).
			return name}
]

{ #category : #accessing }
FogMethodMirror >> name: aString [
	name := aString
]

{ #category : #'as yet unclassified' }
FogMethodMirror >> parameters [
	<doc: 'Returns the method''s parameters: Name and type'>
	^ parameters
]

{ #category : #accessing }
FogMethodMirror >> parameters: aCollection [ 
	parameters := aCollection
]

{ #category : #accessing }
FogMethodMirror >> printOn: aStream [
	aStream nextPutAll: self name
]

{ #category : #accessing }
FogMethodMirror >> return: aCollection [ 
	return := aCollection
]

{ #category : #accessing }
FogMethodMirror >> returnType [
	<doc: 'Returns the returning type'>
	^ return 
]

{ #category : #accessing }
FogMethodMirror >> selector [
	parameters types size = 0
		ifTrue: [ ^ name asSymbol ].
	parameters types size = 1
		ifTrue: [ ^ (name , ':') asSymbol ].
	^ ((2 to: parameters types size) inject: name , ':' into: [ :acc :each | acc , 'and:' ]) asSymbol
]

{ #category : #accessing }
FogMethodMirror >> selectorWithNames [
	parameters types size = 0
		ifTrue: [ ^ name asSymbol ].
	parameters types size = 1
		ifTrue: [ ^ (name , ':' , (parameters variables at: 1)) asSymbol ].
	^ ((2 to: parameters types size)
		inject: name , ':' , (parameters variables at: 1)
		into: [ :acc :each | acc , ' and:' , (parameters variables at: each) ]) asSymbol
]

{ #category : #accessing }
FogMethodMirror >> signature [
	<doc: 'Returns the method signature.'>
	^ '{1}({2})'
		format:
			{name.
			(',' join: (parameters collect: [ :p | p signatureName ]))}
]

{ #category : #'as yet unclassified' }
FogMethodMirror >> using: aSession applyOn: anETHContractInstance at: aBlockHash valueWithArguments: aCollection from: anAccount [
	<doc:
		'Returns a result of applying the method (depending on the kind of method if may respond with data or with a future) using the given setup variables. It delegates the calculation of gas and gas price to the session. It transfers no money during the execution.
		'>
	^ aSession
		apply: self
		on: anETHContractInstance
		at: aBlockHash
		arguments: aCollection
		from: anAccount
		amount: 0
]

{ #category : #'as yet unclassified' }
FogMethodMirror >> using: aSession applyOn: anETHContractInstance at: aBlockHash valueWithArguments: aCollection from: anAccount amount: anAmount [
	<doc:
		'Returns a result of applying the method (depending on the kind of method if may respond with data or with a future) using the given setup variables. It delegates the calculation of gas and gas price to the session. 
		'>
	^ aSession
		apply: self
		on: anETHContractInstance
		at: aBlockHash
		arguments: aCollection
		from: anAccount
		amount: anAmount
]

{ #category : #'as yet unclassified' }
FogMethodMirror >> using: aSession applyOn: anETHContractInstance valueWithArguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice [
	<doc:
		'Returns a result of applying the method (depending on the kind of method if may respond with data or with a future) using the given setup variables. It transfers no money during the execution.
		'>
	^ self
		using: aSession
		applyOn: anETHContractInstance
		valueWithArguments: aCollection
		from: anAccount
		gas: aGasAmount
		gasPrice: aGasPrice
		amount: 0
]

{ #category : #'as yet unclassified' }
FogMethodMirror >> using: aSession applyOn: anETHContractInstance valueWithArguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice amount: anAmount [
	<doc:
		'Returns a result of applying the method (depending on the kind of method if may respond with data or with a future) using the given setup variables. 
		'>
	^ aSession
		apply: self
		on: anETHContractInstance
		arguments: aCollection
		from: anAccount
		gas: aGasAmount
		gasPrice: aGasPrice
		amount: anAmount
]
