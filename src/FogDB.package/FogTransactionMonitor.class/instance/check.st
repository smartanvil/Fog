as yet unclassified
check
	| receipt |
	[ receipt := FogConnection currentConnection eth getTransactionReceipt: transactionHash.
	receipt ifNotNil: [ future deploySuccess: receipt ] ]
		on: Error
		do: [ :e | future deployFailure: e ]