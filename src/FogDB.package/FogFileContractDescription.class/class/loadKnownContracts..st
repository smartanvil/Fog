as yet unclassified
loadKnownContracts: aDirectory
	FogCache current contracts addAll: (aDirectory entries collect: [ :f | self loadCode: f ])