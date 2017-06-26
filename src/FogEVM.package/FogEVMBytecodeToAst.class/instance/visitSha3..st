as yet unclassified
visitSha3: aFogVMSha3
	| content result |
	content := self memoryAccessfrom: stack pop to: stack pop.
	result := self messageSend: #sha3 receiver: content arguments: {}.
	stack push: result