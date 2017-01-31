as yet unclassified
at: aName
	^ types
		at: aName asSymbol
		ifAbsentPut: [ FogASTSimpleType new
				name: aName asSymbol;
				yourself ]