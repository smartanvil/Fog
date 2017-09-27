*FogEVM
mnemonicRuntime
	^ runtime ifNotNil: [ FogEVMByteCode fromBinary: runtime ]