Class {
	#name : #FogMirrorCreationFromEtherscanContent,
	#superclass : #FogTestCase,
	#instVars : [
		'contract',
		'contractSelector',
		'stream'
	],
	#category : #FogLiveTests
}

{ #category : #'building suites' }
FogMirrorCreationFromEtherscanContent class >> testParameters [
	^ super testParameters
		forSelector: #stream addOptions: {STRSolidityFilesProvider default };
		forSelector: #contractSelector addOptions: (1 to: 20 )
]

{ #category : #accessing }
FogMirrorCreationFromEtherscanContent >> contractSelector: aSelector [
	 contractSelector := aSelector
]

{ #category : #accessing }
FogMirrorCreationFromEtherscanContent >> setUp [
	super setUp.
	contract := stream at: contractSelector.
]

{ #category : #accessing }
FogMirrorCreationFromEtherscanContent >> stream: aStream [
	stream := aStream
]

{ #category : #accessing }
FogMirrorCreationFromEtherscanContent >> testDescriptionCreation [
	| package |
	package := session loadPackageForCode: contract named: contract hash asString.
	self assert: (package isKindOf: FogPackage).
	self assert: package descriptions isNotEmpty.
	self assert: package ast isNotNil.

]

{ #category : #accessing }
FogMirrorCreationFromEtherscanContent >> testMirrorClassSideIsCreated [
	| package |
	package := session loadPackageForCode: contract named: contract hash asString.
	self assert: (package descriptions allSatisfy: [ : d | d mirror isNotNil ]).
	self assert: (package descriptions anySatisfy: [ : d | d mirror constructor isNotNil ]).


]

{ #category : #accessing }
FogMirrorCreationFromEtherscanContent >> testMirrorInstanceSideIsCreated [
	"running"

	| package |
	package := session loadPackageForCode: contract named: contract hash asString.
	self assert: (package descriptions allSatisfy: [ :d | d mirror instanceMirror isNotNil ]).
	self assert: (package descriptions allSatisfy: [ :d | d mirror instanceMirror methods isNotEmpty ])
]
