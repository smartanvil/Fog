as yet unclassified
resolveAsCall: anETHContractInstance valueWithArguments: aCollection sender: anAccount
	| result |
	result := self
		unpack:
			(self connection eth
				call:
					(FogCallDefinition new
						from: anAccount address;
						to: anETHContractInstance address;
						gas: 300000 priced: 0;
						data: (self encodeMethodCall: aCollection);
						yourself)
				block: 'latest').
	result size = 0
		ifTrue: [ ^ self ].
	result size = 1
		ifTrue: [ ^ result anyOne ].
	^ result