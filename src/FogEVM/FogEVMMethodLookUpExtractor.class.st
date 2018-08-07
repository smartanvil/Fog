Class {
	#name : #FogEVMMethodLookUpExtractor,
	#superclass : #FogEVMAstVisitor,
	#instVars : [
		'finished',
		'lookUpTable',
		'currentMethodAnalysis'
	],
	#category : 'FogEVM-Decompiler'
}

{ #category : #visiting }
FogEVMMethodLookUpExtractor >> initialize [
	super initialize .
	finished := false. 
	lookUpTable := Dictionary new .
]

{ #category : #visiting }
FogEVMMethodLookUpExtractor >> isErrorHandlingJump: aJump [
	^ aJump address isEVMLiteral and: [ aJump address literalValue asBKNumber = '0x02' asBKNumber ]
]

{ #category : #'as yet unclassified' }
FogEVMMethodLookUpExtractor >> lookUpTable [
	^ lookUpTable
]

{ #category : #visiting }
FogEVMMethodLookUpExtractor >> visitConditionalJump: aFogEVMAstConditionalJump [
	(finished not and: [ aFogEVMAstConditionalJump condition receiver isEVMLiteral ])
		ifTrue: [ lookUpTable
				at: aFogEVMAstConditionalJump condition receiver
				put:
					{(#address -> aFogEVMAstConditionalJump address).
					(#startNode -> nil).
					(#endNode -> nil)} asDictionary ]
]

{ #category : #visiting }
FogEVMMethodLookUpExtractor >> visitJump: aFogEVMAstJump [
	(self isErrorHandlingJump: aFogEVMAstJump)
		ifTrue: [ finished := true ]
		ifFalse: [ super visitJump: aFogEVMAstJump ]
]

{ #category : #visiting }
FogEVMMethodLookUpExtractor >> visitJumpTag: aFogEVMAstJumpTag [
	currentMethodAnalysis := lookUpTable associations
		detect: [ :a | (a value at: #address) literalValue asBKNumber = aFogEVMAstJumpTag address ]
		ifFound: [ :a | 
			a value at: #startNode put: aFogEVMAstJumpTag.
			a key ]
		ifNone: [ currentMethodAnalysis ]
]

{ #category : #visiting }
FogEVMMethodLookUpExtractor >> visitReturn: aReturn [
	(lookUpTable at: currentMethodAnalysis) at: #endNode put: aReturn
]

{ #category : #'as yet unclassified' }
FogEVMMethodLookUpExtractor >> visitSelfDestruct: aFogEVMAstSelfDestruct [ 

]

{ #category : #visiting }
FogEVMMethodLookUpExtractor >> visitStop: aReturn [
	(lookUpTable at: currentMethodAnalysis) at: #endNode put: aReturn
]
