Extension { #name : #SmaCCToken }

{ #category : #'*FogDB' }
SmaCCToken >> acceptVisitor: aFogMirrorSmaccASTBasedBuilder [ 
	^ value asSymbol 
]
