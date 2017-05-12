as yet unclassified
for: aContractBind and: aHash
	^ self new
		contractBind: aContractBind;
		hash: aHash asAddress;
		yourself