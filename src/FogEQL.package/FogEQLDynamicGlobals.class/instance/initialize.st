initialization
initialize
	super initialize.
	connection := FogEQLConnection on: 'http://localhost:8545'.
	default := FogEQLEnvironment new. 