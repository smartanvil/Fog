as yet unclassified
currentConnection
	^ connection ifNil: [ FogConnection connection: (self on: 'http://localhost:8545') ]