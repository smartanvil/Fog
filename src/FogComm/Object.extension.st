Extension { #name : #Object }

{ #category : #'*FogCommunication' }
Object class >> allInstVarNamesForEqualityComparison [
	^self superclass allInstVarNamesForEqualityComparison, self instVarNamesForEqualityComparison
]

{ #category : #'*FogCommunication' }
Object class >> instVarNamesForEqualityComparison [
	^self instVarNames
]

{ #category : #'*FogCommunication' }
Object >> instVarNamesForEqualityComparison [
	^self class allInstVarNamesForEqualityComparison
]

{ #category : #'*FogCommunication' }
Object >> valuesToCompareForEquality [
	^ self instVarNamesForEqualityComparison collect: [ :ivName | self instVarNamed: ivName ]
]
