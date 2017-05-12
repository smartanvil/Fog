as yet unclassified
currentConnection
	^ connection ifNil: [ connection := self on: 'http://localhost:8545' ]