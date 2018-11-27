Extension { #name : #SmaCCToken }

{ #category : #'*FogDB' }
SmaCCToken >> acceptVisitor: aFogMirrorSmaccASTBasedBuilder [ 
	^ aFogMirrorSmaccASTBasedBuilder visitSmaccToken: self 
]
