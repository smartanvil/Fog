initialization
initialize
	super initialize.
	cache := FogSessionCache newSessionCache.
	connection := FogSessionConnection on: 'http://localhost:8545'.
	sessionMembrane := AvMembrane new.
	sessionMembrane crossHandler: FogSessionCrossMembraneCrossHandler new.
	connection session: self.
	cache session: self