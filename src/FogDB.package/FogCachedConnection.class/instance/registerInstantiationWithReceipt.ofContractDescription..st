access db - contract
registerInstantiationWithReceipt: transactionHash ofContractDescription: aContractDescription
	^ self cache
		registerContractBind:
			(super
				registerInstantiationWithReceipt: transactionHash
				ofContractDescription: aContractDescription)