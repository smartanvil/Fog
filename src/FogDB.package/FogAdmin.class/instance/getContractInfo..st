as yet unclassified
getContractInfo: aContractAddress
	^ self send: (api messageGetContractInfo: aContractAddress)