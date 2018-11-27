Extension { #name : #Object }

{ #category : #'*FogComm' }
Object class >> allInstVarNamesForEqualityComparison [
	^self superclass allInstVarNamesForEqualityComparison, self instVarNamesForEqualityComparison
]

{ #category : #'*FogComm' }
Object class >> instVarNamesForEqualityComparison [
	^self instVarNames
]

{ #category : #'*FogComm' }
Object >> instVarNamesForEqualityComparison [
	^self class allInstVarNamesForEqualityComparison
]

{ #category : #'*FogComm' }
Object >> valuesToCompareForEquality [
	^ self instVarNamesForEqualityComparison collect: [ :ivName | self instVarNamed: ivName ]
]
