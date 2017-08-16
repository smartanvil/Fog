initialization
installBuiltinBuffers 


	namedbuffers at: #contract_instances put: FogEQLContractInstancesBuffer new. 
	namedbuffers at: #contracts put: FogEQLContractBuffer new. 
	namedbuffers at: #blocks put: FogEQLBlocksBuffer new. 
	namedbuffers at: #accounts put: FogEQLAccountsBuffer new. 
	namedbuffers at: #transactions put: FogEQLTransactionsBuffer new. 
	