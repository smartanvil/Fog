initialization
initialize
	super initialize.
	environment := FogEQLEnvironment new.
	environment connection: self