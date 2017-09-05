converting
asStream: aFogStreamsEnvironment
	| indexes buffers |
	buffers := self resolveFor: aFogStreamsEnvironment.
	indexes := buffers collect: [ :b | b value all ].
	^ (FogEQLResultStream on: (self resolveFor: aFogStreamsEnvironment))
		index: indexes;
		yourself