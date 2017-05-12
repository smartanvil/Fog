access db - contract
findContractBindByHash: aContractAddress blockNumber: aBlockNumber
	^  self cache 
		detectContractBind: [ :instance | instance address = aContractAddress asAddress ]
		ifNoneCreate: [ super
				findContractBindByHash: aContractAddress
				blockNumber: aBlockNumber ]