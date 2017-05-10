building slots - variables
buildInstanceSlots
	^ description mirror instanceMirror properties
		collect: [ :p | p name asSymbol => FogContractPropertySlot ]