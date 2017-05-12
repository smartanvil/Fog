as yet unclassified
getContractCode: aContractAddress blockNumber: aBlockNumber
	| code |
	code := self send: (api messageGetCode: aContractAddress blockNumber: aBlockNumber).
	^ code = '0x'
		ifTrue: [ nil ]
		ifFalse: [ code ]