"
Storage layout basic protocol 
"
Class {
	#name : #FogEVMAbstractLayout,
	#superclass : #Object,
	#category : 'FogEVM-Storage'
}

{ #category : #accessing }
FogEVMAbstractLayout >> atStorage: anAddress put: aValue [
	self subclassResponsibility
]

{ #category : #accessing }
FogEVMAbstractLayout >> getStorageAt: anIndex [
	^ self subclassResponsibility 
]
