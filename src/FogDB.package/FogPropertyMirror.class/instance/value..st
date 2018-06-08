accessing
value: aContractInstance
	^ self type unpack: (layout fetchContentsFrom: aContractInstance) using: FogHexadecimalPacker new