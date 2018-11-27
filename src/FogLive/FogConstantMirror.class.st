"
I represents an slot that is not defined as storage 
"
Class {
	#name : #FogConstantMirror,
	#superclass : #FogPropertyMirror,
	#instVars : [
		'value'
	],
	#category : 'FogDB-Meta-Mirror'
}

{ #category : #'as yet unclassified' }
FogConstantMirror >> constant: aString [ 
	value := aString
]

{ #category : #'as yet unclassified' }
FogConstantMirror >> instance: bla [
	^ self
]

{ #category : #accessing }
FogConstantMirror >> using: session value: aContractBind at: aBlockTagNumberOrHash [
	^ value
]

{ #category : #'as yet unclassified' }
FogConstantMirror >> value [
	^ self error: ' Should be using using:value:at:'
]
