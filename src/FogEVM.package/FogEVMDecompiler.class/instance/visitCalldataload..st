visiting
visitCalldataload: aFogVMCalldataload
	| calldata var  atIndexMessageSend |
	calldata := self
		specialVariableNamed: #CALLDATA
		loadedWith: FogEVMAstCallData new.
	atIndexMessageSend := self
		messageSend: #at:
		receiver: calldata
		arguments: {(self literalOrVariable: stack pop)}.
	var := self assignToTemporaryVariable: atIndexMessageSend.
	stack push: var