Class {
	#name : #FogPackageloading,
	#superclass : #FogTestCase,
	#instVars : [
		'package'
	],
	#category : #FogLiveTests
}

{ #category : #'building suites' }
FogPackageloading class >> testParameters [
	^ ParametrizedTestMatrix new
		forSelector: #connection addOptions: {[ FogTestingConnection on: self url ]};
		forSelector: #session
			addOptions:
			{[ :test | test connection session ].
			[ :test | test connection nonCachedSession ]};
		forSelector: #sourceCode addOptions: FogTestingContractProvider contractsDescriptionsSrc
]

{ #category : #tests }
FogPackageloading >> package: aPackage [
	package := aPackage 
]

{ #category : #tests }
FogPackageloading >> sourceCode: aSourceCode [
	self package: (session loadPackageForCode: aSourceCode named: #test)
]

{ #category : #tests }
FogPackageloading >> testContractsCanBeFetchedByRef [
	package descriptions do: [ :d | self assert: d equals: (session findReference: d reference) ]
]

{ #category : #tests }
FogPackageloading >> testLoadPackagePoll [
	self assert: (package isKindOf: FogPackage).
	self assert: package name equals: #test
]

{ #category : #tests }
FogPackageloading >> testPackageCanBeFetchedByRef [
	self assert: package equals: (session findReference: package reference)
]

{ #category : #tests }
FogPackageloading >> testPackageContainsDescriptions [
	self assert: (package descriptions allSatisfy: [ :d | d isKindOf: FogContractDescription ])
]

{ #category : #tests }
FogPackageloading >> testPackageContainsDescriptionsAsMuchAsInAST [
	self assert: package descriptions size equals: (package ast sourceunits select: #isContract) size
]
