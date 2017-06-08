as yet unclassified
memoryAccessfrom: from to: to
	| node fromAddress toAddress |
	node := FogEVMAstMemoryLoad new.
	fromAddress := self literalOrVariable: from .
	toAddress := self literalOrVariable: to.
	node fromAddress: fromAddress.
	node amountOfBytes: toAddress.
	self currentScope sequence addStatement: node.
	^ self assignToTemporaryVariable: node