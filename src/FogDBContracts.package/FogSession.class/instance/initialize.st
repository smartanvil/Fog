initialization
initialize
	super initialize.
	cache := FogSessionCache newSessionCache.
	connection := FogSessionConnection on: 'http://localhost:8545'.
	sessionMembrane := AvMembrane new. 
	connection session: self.
	cache session: self