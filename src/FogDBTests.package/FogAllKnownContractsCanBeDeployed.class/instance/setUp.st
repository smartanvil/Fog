initialization
setUp
	super setUp.
	connection := FogCachedSession on: self url.
	self timeLimit: 3 minutes