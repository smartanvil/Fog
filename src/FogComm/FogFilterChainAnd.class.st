"
Chains by and conjugation 
"
Class {
	#name : #FogFilterChainAnd,
	#superclass : #FogFilterChain,
	#category : 'FogComm-Transfer-Filters'
}

{ #category : #'as yet unclassified' }
FogFilterChainAnd >> forTransfer [
	^ a forTransfer , b forTransfer
]
