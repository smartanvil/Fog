"
This is a specific kind of method, that is applied in a different way, and it represents a contructor. 
"
Class {
	#name : #FogConstructorMirror,
	#superclass : #Object,
	#instVars : [
		'parameters',
		'name'
	],
	#category : 'FogLive-Meta-Mirror'
}

{ #category : #'as yet unclassified' }
FogConstructorMirror >> encodeUsing: aSession for: aContractDescription with: anCollectionOfArgs [
	^ aSession encode: self for: aContractDescription with: anCollectionOfArgs
]

{ #category : #testing }
FogConstructorMirror >> hasParameters [
	^ parameters size > 0
]

{ #category : #accessing }
FogConstructorMirror >> name [
	^ '{1}({2}) returns{3}'
		format:
			{name.
			(',' join: (parameters collect: [ :p | p name ])).
			'Contract'}
]

{ #category : #accessing }
FogConstructorMirror >> name: aString [
	name := aString
]

{ #category : #'as yet unclassified' }
FogConstructorMirror >> parameters [
	^ parameters
]

{ #category : #accessing }
FogConstructorMirror >> parameters: aCollection [ 
	parameters := aCollection
]

{ #category : #'as yet unclassified' }
FogConstructorMirror >> selector [
	parameters types size = 0
		ifTrue: [ ^ name asSymbol ].
	parameters types size = 1
		ifTrue: [ ^ (name , ':') asSymbol ].
	^ ((2 to: parameters types size) inject: name , ':' into: [ :acc :each | acc , 'and:' ]) asSymbol
]

{ #category : #'as yet unclassified' }
FogConstructorMirror >> selectorWithNames [
	parameters types size = 0
		ifTrue: [ ^ name asSymbol ].
	parameters types size = 1
		ifTrue: [ ^ (name , ':' , (parameters variables at: 1)) asSymbol ].
	^ ((2 to: parameters types size)
		inject: name , ':' , (parameters variables at: 1)
		into: [ :acc :each | acc , ' and:' , (parameters variables at: each) ]) asSymbol
]

{ #category : #'as yet unclassified' }
FogConstructorMirror >> using: aSession applyOn: aContractDescription valueWithArguments: aCollection from: anAccount [
	^ aSession
		deploy: aContractDescription
		applying: self
		arguments: aCollection
		from: anAccount
		amount: 0
]

{ #category : #'as yet unclassified' }
FogConstructorMirror >> using: aSession applyOn: aContractDescription valueWithArguments: aCollection from: anAccount  amount: anAmount [
	^ aSession
		deploy: aContractDescription
		applying: self
		arguments: aCollection
		from: anAccount
		amount: anAmount
]

{ #category : #'as yet unclassified' }
FogConstructorMirror >> using: aSession applyOn: aContractDescription valueWithArguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice [
	^ self
		using: aSession
		applyOn: aContractDescription
		valueWithArguments: aCollection
		from: anAccount
		gas: aGasAmount
		gasPrice: aGasPrice
		amount: 0
]

{ #category : #'as yet unclassified' }
FogConstructorMirror >> using: aSession applyOn: aContractDescription valueWithArguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice amount: anAmount [
	^ aSession
		deploy: aContractDescription
		applying: self
		arguments: aCollection
		from: anAccount
		gas: aGasAmount
		gasPrice: aGasPrice
		amount: anAmount
]
