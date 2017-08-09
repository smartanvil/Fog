as yet unclassified
visitMappingTypeName: aSolMappingTypeNameNode
	| key value |
	self visitElementaryTypeName: aSolMappingTypeNameNode mapping_type.
	aSolMappingTypeNameNode mapping_type mapped_type acceptVisitor: self.
	key := types at: aSolMappingTypeNameNode mapping_type.
	value := types at: aSolMappingTypeNameNode mapping_type mapped_type.
	types
		at: aSolMappingTypeNameNode
		put:
			(FogMappingType new
				keyType: key;
				valueType: value)