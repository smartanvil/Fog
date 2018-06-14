contract - deploying
receiptFor: aTransactionHash
	^ (monitors
		add:
			(FogTransactionMonitor new
				transactionHash: aTransactionHash;
				session: session;
				yourself)) future