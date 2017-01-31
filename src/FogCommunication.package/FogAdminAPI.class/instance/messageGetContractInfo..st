as yet unclassified
messageGetContractInfo: aContractAddress
	^ FogMessage new
		method: 'admin_getContractInfo';
		parameters:
			{aContractAddress};
		yourself