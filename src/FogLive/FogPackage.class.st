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
	#category : #'FogLive-Meta-Description'
}

{ #category : #accessing }
FogPackage >> addContractDescription: aFogContractDescription [
	descriptions add: aFogContractDescription
]

{ #category : #accessing }
FogPackage >> ast [
	<doc: 'Returns the AST of the package'>
	^ ast
]

{ #category : #accessing }
FogPackage >> ast: aSolRootSourceNode [ 
	ast := aSolRootSourceNode
]

{ #category : #accessing }
FogPackage >> descriptions [
	<doc: 'It returns all the contract descriptions loaded from this package (or file)'>
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
	<doc: 'Returns a reference to point this package in a specific session.'>
	^ FogReference new / name
]

{ #category : #accessing }
FogPackage >> source [
	<doc: 'It returns the source code of the package'>
	^ source
]

{ #category : #accessing }
FogPackage >> source: aString [ 
	source := aString
]
