access db - contract
findContractBindByHash: aContractAddress blockTag: aBlockTag
	^  self cache 
		detectContractBind: [ :instance | instance address = aContractAddress asAddress ]
		ifNoneCreate: [ super findContractBindByHash: aContractAddress blockTag: aBlockTag ]