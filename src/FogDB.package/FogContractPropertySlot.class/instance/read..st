meta-object-protocol
read: aFogContractProxy
	^ aFogContractProxy mirror
		using: aFogContractProxy session
		property: name
		on: aFogContractProxy instance
		at: aFogContractProxy blockReference