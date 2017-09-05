accessing
installTransactionSizeIndex
	indexes
		at: 'transactions.size'
		put:
			(FogEQLTransactionsAmountIndex
				on: [ FogDBBlockGeneralIndexSource new
						sortTxAmountArray:
							(FLMaterializer
								materializeFromFileNamed: (FileLocator indexFolder / 'txamount.fl') fullName) ])