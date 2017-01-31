as yet unclassified
buildLiteralAttributeForSolidity: aCollection
	^ SASTSolidityCompilerPragma new
		version: aCollection second , aCollection third;
		yourself