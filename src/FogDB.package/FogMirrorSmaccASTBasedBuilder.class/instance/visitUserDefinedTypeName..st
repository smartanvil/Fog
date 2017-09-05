as yet unclassified
visitUserDefinedTypeName: aSolUserDefinedTypeNameNode 
	| keyToDefinedType |
	keyToDefinedType := (types keys select: [ :t | t isUserDefined ]) detect: [ :k | k identifierToken value = aSolUserDefinedTypeNameNode user_defined_type value ].
	types at: aSolUserDefinedTypeNameNode put: (types at: keyToDefinedType)