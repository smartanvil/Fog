initialization
initialize
	super initialize.
	connection := FogEQLFogConnection on: 'http://localhost:8545'.
	default := FogEQLEnvironment new. 