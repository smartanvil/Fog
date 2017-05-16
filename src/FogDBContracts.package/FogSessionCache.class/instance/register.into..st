cache management
register: anObject into: aCacheTag
	| object |
	self flag: #Boooooooo.
	object := ((anObject isKindOf: FogMethodMirror) or: [( anObject isKindOf: FogConstructorMirror )or: [  (anObject isKindOf: FogContractMirror ) or: [(anObject isKindOf: FogContractInstanceMirror ) ]  ]])
		ifTrue: [ session register: anObject ]
		ifFalse: [ anObject ].
	^ super register: object into: aCacheTag