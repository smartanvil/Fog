Class {
	#name : #FogPackage,
	#superclass : #Object,
	#instVars : [
		'name',
		'descriptions',
		'ast',
		'source'
	],
	#category : #'FogDB-Session'
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
FogPackage >> initialize [
	super initialize .
	descriptions := Set new . 
]

{ #category : #testing }
FogPackage >> isFogPackage [
	^ true 
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
FogPackage >> source: aString [ 
	source := aString
]
