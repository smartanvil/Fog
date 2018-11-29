Extension { #name : #SmaCCToken }

{ #category : #'*FogLive' }
SmaCCToken >> acceptVisitor: aFogMirrorSmaccASTBasedBuilder [ 
	^ aFogMirrorSmaccASTBasedBuilder visitSmaccToken: self 
]
