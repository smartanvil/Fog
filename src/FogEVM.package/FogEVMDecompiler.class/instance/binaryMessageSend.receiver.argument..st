as yet unclassified
binaryMessageSend: selector receiver: receiver argument: argument
	| messageSend variable  |
	messageSend := FogEVMAstBinaryMessageSend new.
	messageSend receiver: receiver.
	messageSend selector: selector.
	messageSend argument: argument.
	variable := self assignToTemporaryVariable: messageSend.
	^ variable