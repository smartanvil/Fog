"
Trait that implements an equality by attirbutes 
"
Trait {
	#name : #TEquality,
	#category : 'FogCommunication-Util'
}

{ #category : #equality }
TEquality >> = anObject [
	self species = anObject species
		ifFalse: [ ^ false ].
	^ self valuesToCompareForEquality = anObject valuesToCompareForEquality
]

{ #category : #equality }
TEquality >> hash [
	^self valuesToCompareForEquality inject: self species hash into: [:hash :comparisonValue|
		(hash bitXor: comparisonValue hash) hashMultiply]

]
