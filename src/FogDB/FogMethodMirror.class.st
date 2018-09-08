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
	#category : 'FogDB-Meta-Mirror'
}

{ #category : #accessing }
FogMethodMirror >> baseName [
	^ name 
]

{ #category : #'as yet unclassified' }
FogMethodMirror >> hasParameters [
	^ parameters size > 0
]

{ #category : #testing }
FogMethodMirror >> isStateModifier [
	^ modifiesState
]

{ #category : #accessing }
FogMethodMirror >> modifiesState: aFalse [  
	modifiesState := aFalse
]

{ #category : #accessing }
FogMethodMirror >> name [
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
	^ '{1}({2})'
		format:
			{name.
			(',' join: (parameters collect: [ :p | p signatureName ]))}
]

{ #category : #'as yet unclassified' }
FogMethodMirror >> using: aSession applyOn: anETHContractInstance at: aBlockHash valueWithArguments: aCollection from: anAccount [
	^ aSession
		apply: self
		on: anETHContractInstance
		at: aBlockHash
		arguments: aCollection
		from: anAccount
		amount: 0.

]

{ #category : #'as yet unclassified' }
FogMethodMirror >> using: aSession applyOn: anETHContractInstance at: aBlockHash valueWithArguments: aCollection from: anAccount amount: anAmount [
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
	^ aSession
		apply: self
		on: anETHContractInstance
		arguments: aCollection
		from: anAccount
		gas: aGasAmount
		gasPrice: aGasPrice
		amount: anAmount
]
