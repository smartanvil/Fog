accessing
cache
	^ cache ifNil: [ FogCache current ]