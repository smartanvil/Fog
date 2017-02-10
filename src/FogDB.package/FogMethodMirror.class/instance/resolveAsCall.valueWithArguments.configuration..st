as yet unclassified
resolveAsCall: anETHContractInstance valueWithArguments: aCollection configuration: aConfigurationDictionaryOrAssociationArray
	| returnValue |
	returnValue := self connection eth
		call:
			(FogCallDefinition new
				load: aConfigurationDictionaryOrAssociationArray;
				data: (self encodeMethodCall: aCollection);
				yourself)
		block: 'latest'.
	^ self decodeReturn: returnValue