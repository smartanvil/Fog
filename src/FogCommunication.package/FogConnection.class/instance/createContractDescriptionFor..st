creation
createContractDescriptionFor: aCode
	^ FogContractDescription new
		name: 'Unknown Contract';
		binary: aCode;
		yourself