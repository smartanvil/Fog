creation
createContractBindFor: aFogFileContractDescription at: aContractAddress
	^ FogContractInstanceBind new
		address: aContractAddress;
		contract: aFogFileContractDescription;
		yourself