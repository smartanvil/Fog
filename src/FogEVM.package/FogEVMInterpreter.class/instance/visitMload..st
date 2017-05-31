as yet unclassified
visitMload: aFogVMMload
	| fromAddress toAddress |
	fromAddress := stack pop.
	toAddress := (fromAddress asBKNumber + FogEVMInterpreter wordSize) asBKHexa.
	stack push: (memory fetchFrom: fromAddress to: toAddress)