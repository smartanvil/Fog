initialization
setUp
	super setUp.
	connection := FogCachedConnection on: self url.
	self timeLimit: 3 minutes