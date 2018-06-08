as yet unclassified
visitElementaryTypeName: aSolElementaryTypeNameNode
	| type symbol |
	symbol := aSolElementaryTypeNameNode type acceptVisitor: self.
	type := symbol = #string
		ifTrue: [ FogStringType new ]
		ifFalse: [ FogSimpleType new
				name: symbol;
				yourself ].
	types at: aSolElementaryTypeNameNode ifAbsentPut: [ type ]