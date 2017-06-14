extraction
extractFrom: aFogEVMAstScope 
	scope := aFogEVMAstScope.
	method := FogEVMAstMethod new.
	aFogEVMAstScope accept: self .