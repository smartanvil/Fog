tests
testGetArray 
self assert: (FogUtils new sha3_256:'getArray()') equals: (Keccak hashMessage:'getArray()' ) asByteArray hex