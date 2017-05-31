visit - hashing
visitSha3: aFogVMSha3
	| fromAddress toAddress kck |
	fromAddress := stack pop.
	toAddress := stack pop.
	kck := self keccack256: (memory fetchFrom: fromAddress to: toAddress).
	stack push: kck.