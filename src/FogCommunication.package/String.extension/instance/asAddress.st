*FogCommunication
asAddress
	^ (self beginsWith: '0x')
		ifTrue: [ self ]
		ifFalse: [ '0x' , self ]