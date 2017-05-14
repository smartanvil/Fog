visiting
visitFunction: aSASTFunction
	aSASTFunction parameters variables collect: #type thenDo: [ :t | t accept: self ].
	aSASTFunction return variables collect: #type thenDo: [ :t | t accept: self ].
	aSASTFunction isConstructor
		ifTrue: [ constructor := self createConstructor: aSASTFunction ]
		ifFalse: [ methods add: (self createMethod: aSASTFunction) ]