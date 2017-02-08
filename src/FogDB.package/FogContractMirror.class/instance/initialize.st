accessing
initialize
	super initialize.
	instanceMirror := FogContractInstanceMirror new.
	instanceMirror contractMirror: self.