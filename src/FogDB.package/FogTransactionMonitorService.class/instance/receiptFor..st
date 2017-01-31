as yet unclassified
receiptFor: aTransactionHash
	^ (monitors
		add:
			(FogTransactionMonitor new
				transactionHash: aTransactionHash;
				yourself)) future