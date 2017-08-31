accessing
installTransactionSizeIndex
	indexes
		at: 'transactions.size'
		put:
			(FogEQLTransactionsAmountIndex
				on: [ FogDBBlockGeneralIndexSource new sortTxAmountArray: (FLMaterializer materializeFromFileNamed: '/home/santiago/txamount.fl') ])