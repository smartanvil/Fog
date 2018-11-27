"
Chains by and conjugation 
"
Class {
	#name : #FogFilterChainAnd,
	#superclass : #FogFilterChain,
	#category : 'FogCommunication-Transfer-Filters'
}

{ #category : #'as yet unclassified' }
FogFilterChainAnd >> forTransfer [
	^ a forTransfer , b forTransfer
]
