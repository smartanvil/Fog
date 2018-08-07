creation
createContractDescriptionForBinary: aCode
	^ FogContractDescription new
		name: 'Unknown Contract';
		binary: aCode;
		yourself