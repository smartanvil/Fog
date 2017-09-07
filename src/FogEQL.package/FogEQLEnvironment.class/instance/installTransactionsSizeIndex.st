initialization
installTransactionsSizeIndex
	indexRegistry
		at: FogEQLTransactionsAmountIndex
		put:
			(FogEQLTransactionsAmountIndex
				on: [ FogDBBlockGeneralIndexSource new
						sortTxAmountArray: (FLMaterializer materializeFromFileNamed: (FileLocator indexFolder / 'txamount.fl') fullName) ])