access db - contract
findContractInstanceByHash: aContractAddress blockTag: aBlockNumber
	^  self cache 
		detectContractBind: [ :instance | instance address = aContractAddress asAddress ]
		ifNoneCreate: [ super
				findContractInstanceByHash: aContractAddress
				blockNumber: aBlockNumber ]