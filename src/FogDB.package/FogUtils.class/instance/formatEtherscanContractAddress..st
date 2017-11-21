formatting
formatEtherscanContractAddress: address
	"Format address to remove #code (the standard in etherscan links)"

	| sharpindex |
	sharpindex := address findString: '#'.
	sharpindex == 0
		ifFalse: [ ^ address copyFrom: 1 to: sharpindex - 1 ]
		ifTrue: [ ^ address ]