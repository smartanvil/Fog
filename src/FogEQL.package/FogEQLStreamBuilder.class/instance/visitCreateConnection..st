visiting
visitCreateConnection: aFogEQLCreateConnection
	| conn message |
	[ conn := FogEQLDynamicGlobals value connections
		detect: [ :c | c name = aFogEQLCreateConnection connection name ]
		ifNone: [ aFogEQLCreateConnection connection ].
	message := conn == aFogEQLCreateConnection connection
		ifTrue: [ 'new connection created' ]
		ifFalse: [ 'connection modified' ].
	FogEQLDynamicGlobals value connections remove: conn ifAbsent: [  ].
	FogEQLDynamicGlobals value addConnection: conn ]
		on: Error
		do: [ :e | message := e messageText ].
	^ {message} readStream