visiting
isErrorHandlingJump: aJump
	^ aJump address isEVMLiteral and: [ aJump address literalValue asBKNumber = '0x02' asBKNumber ]