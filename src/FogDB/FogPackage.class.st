"
A package is the best name we found for a the representation ofthe contracts included in a solidity file. 
Normally this object contains the source of the file, the full ast and the contract descirptions loaded .
For navigation, a package must have a name.


"
Class {
	#name : #FogPackage,
	#superclass : #Object,
	#instVars : [
		'name',
		'descriptions',
		'ast',
		'source'
	],
	#category : #'FogDB-Meta-Description'
}

{ #category : #accessing }
FogPackage >> addContractDescription: aFogContractDescription [
	descriptions add: aFogContractDescription
]

{ #category : #accessing }
FogPackage >> ast [
	^ ast
]

{ #category : #accessing }
FogPackage >> ast: aSolRootSourceNode [ 
	ast := aSolRootSourceNode
]

{ #category : #accessing }
FogPackage >> descriptions [
	^ descriptions
]

{ #category : #accessing }
FogPackage >> index [
	^ (MD5 hashStream: source readStream) hex
]

{ #category : #accessing }
FogPackage >> initialize [
	super initialize .
	descriptions := Set new . 
]

{ #category : #accessing }
FogPackage >> name [
	^ name
]

{ #category : #accessing }
FogPackage >> name: aString [ 
	name := aString
]

{ #category : #accessing }
FogPackage >> reference [
	^ FogReference new / name
]

{ #category : #accessing }
FogPackage >> source [
	^ source
]

{ #category : #accessing }
FogPackage >> source: aString [ 
	source := aString
]
