Class {
	#name : #FogContractProxyGenerationTest,
	#superclass : #FogTestCase,
	#instVars : [
		'builder',
		'mirror',
		'description'
	],
	#category : #FogDBTests
}

{ #category : #'building suites' }
FogContractProxyGenerationTest class >> testParameters [
	^ super testParameters
		forSelector: #description
		addOptions: FogTestingContractProvider contractDescriptions
]

{ #category : #tests }
FogContractProxyGenerationTest >> assertMethodSelector: body argumentAmountEquals: amount [
	| selector |
	selector := self extractSelector: body.
	self assert: selector numArgs equals: amount
]

{ #category : #tests }
FogContractProxyGenerationTest >> description: aDescription [
	description := aDescription
]

{ #category : #tests }
FogContractProxyGenerationTest >> extractDelegationsToMethod: aMethodBody [
	| captures | 
	captures := FogRBAstMessageSendCapturer new.
	(RBParser parseMethod: aMethodBody ) acceptVisitor: captures. 
	^ captures messages 
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
	super setUp.
	builder := FogContractProxyBuilder new.
	builder description: description.
	mirror := description mirror.
	self timeLimit: 5 minutes
]

{ #category : #tests }
FogContractProxyGenerationTest >> testClassMethodsWithAmountNoParametersAreGenerated [
	self assertMethodSelector: (builder compilableClassMethodAmount: mirror constructor) argumentAmountEquals: 2
]

{ #category : #tests }
FogContractProxyGenerationTest >> testClassMethodsWithNoParametersAreGenerated [
	self assertMethodSelector: (builder compilableClassMethod: mirror constructor) argumentAmountEquals: 1
]

{ #category : #tests }
FogContractProxyGenerationTest >> testCreateContractCreatesAContractAndTrait [
	self deny: (Smalltalk globals at: builder buildClassName asSymbol ifPresent: [ true ] ifAbsent: [ false ]).
	self deny: (Smalltalk globals at: builder buildTraitName asSymbol ifPresent: [ true ] ifAbsent: [ false ]).
	builder createContractProxy.
	self assert: (Smalltalk globals at: builder buildClassName asSymbol ifPresent: [ true ] ifAbsent: [ false ]).
	self assert: (Smalltalk globals at: builder buildTraitName asSymbol ifPresent: [ true ] ifAbsent: [ false ]).
	self assert: builder buildCategoryName asPackage classes size equals: 2.
	builder buildCategoryName asPackage removeFromSystem
]

{ #category : #tests }
FogContractProxyGenerationTest >> testMethodsDelegateToMethodAmountUnderstandableMessages [
	| generated |
	generated := mirror instanceMirror methods
		select: #hasParameters
		thenCollect: [ :mm | builder compilableMethodAmount: mm ].
	self assert: generated isNotEmpty.
	generated
		do: [ :g | 
			| delegates |
			delegates := self extractDelegationsToMethod: g.
			self assert: delegates isNotEmpty.
			delegates do: [ :s | self assert: (FogMethodMirror canUnderstand: s) ] ]
]

{ #category : #tests }
FogContractProxyGenerationTest >> testMethodsDelegateToMethodUnderstandableMessages [
	| generated |
	generated := mirror instanceMirror methods
		select: #hasParameters
		thenCollect: [ :mm | builder compilableMethod: mm ].
	self assert: generated isNotEmpty.
	generated
		do: [ :g | 
			| delegates |
			delegates := self extractDelegationsToMethod: g.
			self assert: delegates isNotEmpty.
			delegates do: [ :s | self assert: (FogMethodMirror canUnderstand: s) ] ]
]

{ #category : #tests }
FogContractProxyGenerationTest >> testMethodsWithAmountNoParametersAreGenerated [
	| generated |
	generated := mirror instanceMirror methods reject: #hasParameters thenCollect: [ :mm | builder compilableMethodAmount: mm ].
	self assert: generated isNotEmpty.
	generated do: [ :g | self assertMethodSelector: g argumentAmountEquals: 1 ]
]

{ #category : #tests }
FogContractProxyGenerationTest >> testMethodsWithAmountParametersAreGenerated [
	| generated |
	generated := mirror instanceMirror methods
		select: #hasParameters
		thenCollect: [ :mm | 
			{(builder compilableMethodAmount: mm).
			mm parameters size} ].
	self assert: generated isNotEmpty.
	generated do: [ :g | self assertMethodSelector: (g at: 1) argumentAmountEquals: (g at: 2) + 1 ]
]

{ #category : #tests }
FogContractProxyGenerationTest >> testMethodsWithNoParametersAreGenerated [
	| generated |
	generated := mirror instanceMirror methods
		select: #hasParameters
		thenCollect: [ :mm | 
			{(builder compilableMethod: mm).
			mm parameters size} ].
	self assert: generated isNotEmpty.
	generated do: [ :g | self assertMethodSelector: (g at: 1) argumentAmountEquals: (g at: 2) ]
]

{ #category : #tests }
FogContractProxyGenerationTest >> testProxyIsDeployed [
	| contract instance |
	contract := builder createContractProxy.
	instance := contract constructorSession: session.
	instance session: session. 
	self assert: instance contractAddress size > 20.
]
