"
chains by or conjugation 
"
Class {
	#name : #FogFilterChainOr,
	#superclass : #FogFilterChain,
	#category : 'FogComm-Transfer-Filters'
}

{ #category : #'as yet unclassified' }
FogFilterChainOr >> forTransfer [
	^ {(a forTransfer , b forTransfer)}
]
