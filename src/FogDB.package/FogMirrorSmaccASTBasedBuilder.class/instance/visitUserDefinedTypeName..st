as yet unclassified
visitUserDefinedTypeName: aSolUserDefinedTypeNameNode
	| keyToDefinedType |
	keyToDefinedType := (types keys select: [ :t | t isUserDefined ])
		detect: [ :k | k identifier value = aSolUserDefinedTypeNameNode value value ].
	types at: aSolUserDefinedTypeNameNode put: (types at: keyToDefinedType)