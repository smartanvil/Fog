as yet unclassified
visitMappingTypeName: aSolMappingTypeNameNode
	| key value |
	aSolMappingTypeNameNode key_type acceptVisitor: self.
	aSolMappingTypeNameNode value_type  acceptVisitor: self.
	key := types at: aSolMappingTypeNameNode key_type.
	value := types at: aSolMappingTypeNameNode value_type.
	types
		at: aSolMappingTypeNameNode
		put:
			(FogMappingType new
				keyType: key;
				valueType: value)