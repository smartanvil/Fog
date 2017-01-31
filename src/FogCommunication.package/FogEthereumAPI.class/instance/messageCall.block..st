as yet unclassified
messageCall: aETHCallDefinition block: blockRef
	^ FogMessage new
		method: 'eth_call';
		parameters:
			{aETHCallDefinition.
			blockRef};
		yourself