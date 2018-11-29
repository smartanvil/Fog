"
Superclass for and / or objects . It allows to chain conditions
"
Class {
	#name : #FogFilterChain,
	#superclass : #Object,
	#instVars : [
		'a',
		'b'
	],
	#category : 'FogComm-Transfer-Filters'
}

{ #category : #accessing }
FogFilterChain >> a: aETHFilterDefinition [ 
	a := aETHFilterDefinition
]

{ #category : #'as yet unclassified' }
FogFilterChain >> and: aETHFilterTopic [
	^ FogFilterChainAnd new
		a: self;
		b: aETHFilterTopic;
		yourself
]

{ #category : #accessing }
FogFilterChain >> b: aETHFilterTopic [ 
	b := aETHFilterTopic
]

{ #category : #'as yet unclassified' }
FogFilterChain >> forTransfer [
	self subclassResponsibility .
]

{ #category : #accessing }
FogFilterChain >> or: aETHFilterTopic [
	^ FogFilterChainOr new
		a: self;
		b: aETHFilterTopic;
		yourself
]
