visiting
visitElementaryType: aSASTElementaryType
	| type |
	type := aSASTElementaryType name = #string
		ifTrue: [ FogStringType new ]
		ifFalse: [ FogSimpleType new
				name: aSASTElementaryType name;
				yourself ].
	types at: aSASTElementaryType ifAbsentPut: [ type ].