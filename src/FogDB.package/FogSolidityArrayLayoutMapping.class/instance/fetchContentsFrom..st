initialization
fetchContentsFrom: anETHContractInstanceBind
	| hash size value |
	" Aaaaaa, no habia que mandar aBKNumber no? Que bueno que estas en australia ahora. "
	size := (super fetchContentsFrom: anETHContractInstanceBind) asBKNumber.
	hash := (Keccak hashEncode: (FogBinaryPacker packUint128: fromSlot)) asBKNumber.
	^ (hash to: hash + size - 1) collect: [ :i | (anETHContractInstanceBind getStorageAt: i asHeadlessHexa) asHeadlessHexa ]