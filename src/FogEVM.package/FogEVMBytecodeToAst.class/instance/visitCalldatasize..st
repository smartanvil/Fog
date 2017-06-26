visiting
visitCalldatasize: aFogVMCalldatasize
	| variable |
	variable := self specialVariableNamed: #CALLDATASIZE loadedWith: FogEVMAstCallDataSize new.
	stack push: variable