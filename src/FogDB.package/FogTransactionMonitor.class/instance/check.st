checking
check
	| receipt |
	[ receipt := session receiptForTransaction: transactionHash.
	receipt ifNotNil: [ future deploySuccess: receipt ] ]
		on: Error 
		do: [ :e | self halt. future deployFailure: e ]