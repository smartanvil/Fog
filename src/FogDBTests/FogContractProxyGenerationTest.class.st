Class {
	#name : #FogContractProxyGenerationTest,
	#superclass : #FogTestCase,
	#instVars : [
		'builder',
		'mirror'
	],
	#category : #FogDBTests
}

{ #category : #tests }
FogContractProxyGenerationTest >> assertMethodSelector: body argumentAmountEquals: amount [
	| selector |
	selector := self extractSelector: body.
	self assert: selector numArgs equals: amount
]

{ #category : #tests }
FogContractProxyGenerationTest >> extractSelector: body [
	| stream selectorParts |
	stream := body lines first readStream.
	selectorParts := OrderedCollection new.
	[ stream atEnd ]
		whileFalse: [ | part |
			part := stream upToAll: ':'.
			stream atEnd
				ifFalse: [ part := part , ':' ].
			selectorParts add: part.
			stream next.
			stream upToAll: ' ' ].
	^ ('' join: selectorParts) asSymbol
]

{ #category : #tests }
FogContractProxyGenerationTest >> setUp [
	| description |
	super setUp.
	builder := FogContractProxyBuilder new.
	description := FogTestingContractProvider public3StatesPollContract: session.
	builder description: description.
	mirror := description mirror.
]

{ #category : #tests }
FogContractProxyGenerationTest >> testClassMethodsWithAmountNoParametersAreGenerated [
	self assertMethodSelector: (builder compilableClassMethodAmount: mirror constructor) argumentAmountEquals: 1
]

{ #category : #tests }
FogContractProxyGenerationTest >> testClassMethodsWithNoParametersAreGenerated [
	self assertMethodSelector: (builder compilableClassMethod: mirror constructor) argumentAmountEquals: 0
]

{ #category : #tests }
FogContractProxyGenerationTest >> testMethodsWithAmountNoParametersAreGenerated [
	| generated |
	generated := mirror instanceMirror methods reject: #hasParameters thenCollect: [ :mm | builder compilableMethodAmount: mm ].
	generated do: [ :g | self assertMethodSelector: g argumentAmountEquals: 1 ]
]

{ #category : #tests }
FogContractProxyGenerationTest >> testMethodsWithNoParametersAreGenerated [
	| generated |
	generated := mirror instanceMirror methods
		reject: #hasParameters
		thenCollect: [ :mm | builder compilableMethod: mm ].
	generated do: [ :g | self assertMethodSelector: g argumentAmountEquals: 0 ]
]
