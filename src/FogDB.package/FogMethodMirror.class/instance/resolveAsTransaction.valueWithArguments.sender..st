as yet unclassified
resolveAsTransaction: anETHContractInstance valueWithArguments: aCollection sender: anAccount
	^ self connection eth
		sendTransaction:
			(FogCallDefinition new
				from: anAccount address;
				to: anETHContractInstance address;
				gas: 300000 priced: 0;
				data: (self encodeMethodCall: aCollection);
				yourself)