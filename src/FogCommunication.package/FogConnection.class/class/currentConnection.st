as yet unclassified
currentConnection
	^ connection ifNil: [ connection := FogConnection on: 'http://localhost:8545' ]