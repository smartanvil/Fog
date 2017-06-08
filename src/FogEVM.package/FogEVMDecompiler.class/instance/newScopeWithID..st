public
newScopeWithID: anID
	anID = 0
		ifTrue: [ currentScope := FogEVMAstScope new
				id: anID;
				yourself.
			scopes at: anID put: currentScope ]