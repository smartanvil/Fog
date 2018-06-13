contract - deploying
encode: aConstructor for: aContractDescription with: aCollection
	^ aContractDescription binary , (self encodeArguments: aCollection for: aConstructor)