Class {
	#name : #FogMirrorCreationFromEtherscanContent,
	#superclass : #FogTestCase,
	#instVars : [
		'contract',
		'contractSelector'
	],
	#classVars : [
		'testingContract'
	],
	#category : #FogLiveTests
}

{ #category : #'building suites' }
FogMirrorCreationFromEtherscanContent class >> testParameters [
	^ super testParameters
		forSelector: #contractSelector
		addOptions: (SmGContractsContents selectors reject: [ :s | s beginsWith: 'base64' ])
]

{ #category : #'as yet unclassified' }
FogMirrorCreationFromEtherscanContent >> contractSelector: aSelector [
	 contractSelector := aSelector
]

{ #category : #running }
FogMirrorCreationFromEtherscanContent >> setUp [
	super setUp.
	contract := SmGContractsContents new perform: contractSelector
]

{ #category : #running }
FogMirrorCreationFromEtherscanContent >> testDescriptionCreation [
	| package |
	package := session loadPackageForCode: contract named: contractSelector.
	self assert: (package isKindOf: FogPackage).
	self assert: package descriptions isNotEmpty.
	self assert: package ast isNotNil.

]

{ #category : #running }
FogMirrorCreationFromEtherscanContent >> testMirrorClassSideIsCreated [
	| package |
	package := session loadPackageForCode: contract named: contractSelector.
	self assert: (package descriptions allSatisfy: [ : d | d mirror isNotNil ]).
	self assert: (package descriptions allSatisfy: [ : d | d mirror constructor isNotNil ]).


]

{ #category : #running }
FogMirrorCreationFromEtherscanContent >> testMirrorInstanceSideIsCreated [
	| package |
	package := session loadPackageForCode: contract named: contractSelector.
	self assert: (package descriptions allSatisfy: [ :d | d mirror instanceMirror isNotNil ]).
	self
		assert: (package descriptions allSatisfy: [ :d | d mirror instanceMirror methods isNotEmpty ])
]
