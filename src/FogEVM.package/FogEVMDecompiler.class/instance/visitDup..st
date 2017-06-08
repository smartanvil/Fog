visiting
visitDup: aFogVMDup
	| element |
	element := stack at: aFogVMDup expectedPops.
	stack push: element 