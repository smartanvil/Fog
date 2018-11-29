"
Readonly slot based on fog mirror properties 
"
Class {
	#name : #FogContractPropertySlot,
	#superclass : #Slot,
	#category : 'FogLive-Domain-Contracts'
}

{ #category : #'meta-object-protocol' }
FogContractPropertySlot >> read: aFogContractProxy [
	^ aFogContractProxy mirror
		using: aFogContractProxy session
		property: name
		on: aFogContractProxy instance
		at: aFogContractProxy blockReference
]

{ #category : #writing }
FogContractPropertySlot >> write: value to: object [
	^  'Contract Property slots are readonly' logCr.
]
