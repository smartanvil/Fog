equality
balanceOn: aBlockNumberOrHash
	^ self session getBalance: self address block: aBlockNumberOrHash