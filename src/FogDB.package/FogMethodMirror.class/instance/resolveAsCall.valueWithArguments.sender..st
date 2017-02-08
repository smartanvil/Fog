as yet unclassified
resolveAsCall: anETHContractInstance valueWithArguments: aCollection sender: anAccount
	| returnValue |
	returnValue := self connection eth
		call:
			(FogCallDefinition new
				from: anAccount address;
				to: anETHContractInstance address;
				gas: 300000 priced: 60;
				data: (self encodeMethodCall: aCollection);
				yourself)
		block: 'latest'.
	^ self decodeReturn: returnValue