initialization
connection: aConnection
	connection := aConnection.
	self installBuiltinIndexes.
	self installBuiltinBuffers.
	