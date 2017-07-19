tests
testGetExample2 
self assert: (FogUtils new sha3_256:'getExample2()') equals: (Keccak hashMessage:'getExample2()' ) asByteArray hex