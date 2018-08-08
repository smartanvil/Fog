"
Contract storage represents the entry point of the storage. It layout 
"
Class {
	#name : #FogEVMBucketStorage,
	#superclass : #Object,
	#instVars : [
		'storage'
	],
	#category : 'FogEVM-Storage'
}

{ #category : #accessing }
FogEVMBucketStorage >> atStorage: anAddress put: aValue [
	storage atStorage: anAddress put: aValue
]

{ #category : #initialization }
FogEVMBucketStorage >> getStorageAt: anIndex [
	^ storage getStorageAt: anIndex
]

{ #category : #initialization }
FogEVMBucketStorage >> initialize [
	storage := FogEVMMemoryLayout new
]
