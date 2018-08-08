"
Memory layout, it implements a key-value storage by using a dictionary. Cheap to implement, expensive to use. Easy to debug 
"
Class {
	#name : #FogEVMMemoryLayout,
	#superclass : #FogEVMAbstractLayout,
	#instVars : [
		'dictionary'
	],
	#category : 'FogEVM-Storage'
}

{ #category : #accessing }
FogEVMMemoryLayout >> atStorage: anAddress put: aValue [
	^ dictionary at: anAddress put: aValue
]

{ #category : #accessing }
FogEVMMemoryLayout >> getStorageAt: anIndex [
	^ dictionary at: anIndex ifAbsent: [ '0x0' ]
]

{ #category : #initialization }
FogEVMMemoryLayout >> initialize [
	super initialize .
	dictionary := Dictionary new.
]
