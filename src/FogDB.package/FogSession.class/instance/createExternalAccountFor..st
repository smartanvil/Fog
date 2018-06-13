creation
createExternalAccountFor: hashAccount
	^ (FogExternalAccount for: hashAccount)
		session: self;
		yourself