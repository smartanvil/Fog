Class {
	#name : #FogPackageloading,
	#superclass : #FogTestCase,
	#instVars : [
		'package'
	],
	#category : #FogDBTests
}

{ #category : #'building suites' }
FogPackageloading class >> testParameters [
	^ super testParameters
		forSelector: #package
		addOptions: FogTestingContractProvider packagesDescriptions
]

{ #category : #tests }
FogPackageloading >> package: aPackage [
	package := aPackage 
]

{ #category : #tests }
FogPackageloading >> testLoadPackagePoll [
	self assert: package isFogPackage.
	self assert: package name equals: #test.
]

{ #category : #tests }
FogPackageloading >> testPackageContainsDescriptions [
	self assert: (package descriptions allSatisfy: [ :d | d isKindOf: FogContractDescription ])
]

{ #category : #tests }
FogPackageloading >> testPackageContainsDescriptionsAsMuchAsInAST [
	self assert: package descriptions size equals: (package ast sourceunits select: #isContract) size
]
