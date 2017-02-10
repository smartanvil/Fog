as yet unclassified
resolveAsTransaction: anETHContractInstance valueWithArguments: aCollection configuration: aConfigurationDictionaryOrAssociationArray
	^ self connection eth
		sendTransaction:
			(FogCallDefinition new
				load: aConfigurationDictionaryOrAssociationArray;
				data: (self encodeMethodCall: aCollection);
				yourself)