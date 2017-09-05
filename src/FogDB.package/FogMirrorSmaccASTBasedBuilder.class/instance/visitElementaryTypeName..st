as yet unclassified
visitElementaryTypeName: aSolElementaryTypeNameNode
	| type |
	type := aSolElementaryTypeNameNode elementary_type value = #string
		ifTrue: [ FogStringType new ]
		ifFalse: [ FogSimpleType new
				name: aSolElementaryTypeNameNode elementary_type value;
				yourself ].
	types at: aSolElementaryTypeNameNode ifAbsentPut: [ type ]