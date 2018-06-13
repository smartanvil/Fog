access db - contract
findContractInstanceByHash: aContractAddress blockNumber: aBlockNumber
	^  self cache 
		detectContractBind: [ :instance | instance address = aContractAddress asAddress ]
		ifNoneCreate: [ super
				findContractInstanceByHash: aContractAddress
				blockNumber: aBlockNumber ]