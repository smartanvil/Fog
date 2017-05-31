as yet unclassified
manageBreakpointFor: aMemoryEntry atMethod: aMethod
	aMemoryEntry shouldBreak
		ifTrue: [ Breakpoint new
				node: aMethod ast;
				once;
				install ]