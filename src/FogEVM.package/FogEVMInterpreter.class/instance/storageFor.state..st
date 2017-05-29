as yet unclassified
storageFor: aContractAddress state: aStateHash 
	self flag: #WeshouldCareAboutTheMerkelTreeState. 
	^ self storage at: aContractAddress ifAbsentPut: [ FogEVMBucketStorage new ].