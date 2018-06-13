initialization
using: aSession fetchContentsFrom: aContractAddress at: aBlockTagNumberOrHash
	| hash size |
	" Aaaaaa, no habia que mandar aBKNumber no? Que bueno que estas en australia ahora. "
	size := (super using: aSession fetchContentsFrom: aContractAddress at: aBlockTagNumberOrHash) asBKNumber.
	hash := (Keccak hashEncode: (FogBinaryPacker packUint128: fromSlot)) asBKNumber.
	^ (hash to: hash + size - 1)
		collect: [ :i | (aSession fetchSlot: i asHeadlessHexa onContract: aContractAddress at: aBlockTagNumberOrHash) asHeadlessHexa ]