visiting
visitMload: aFogVMMload
	| memoryLoadNode from amount var |
	memoryLoadNode := FogEVMAstMemoryLoad new.
	from := self literalOrVariable: stack pop.
	amount := self literalOrVariable: FogEVMInterpreter wordSize asBKHexa.
	memoryLoadNode fromAddress: from.
	memoryLoadNode amountOfBytes: amount.
	var := self assignToTemporaryVariable: memoryLoadNode.
	stack push: var