accessing
contract: aFogEVMMnemonicContract
	executableMemory := aFogEVMMnemonicContract sequence copy.
	executableMemory do: #initialize.
	program := aFogEVMMnemonicContract