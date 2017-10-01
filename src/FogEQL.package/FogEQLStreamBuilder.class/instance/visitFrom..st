visiting
visitFrom: aFogEQLFrom
	| buffers indexes |
	buffers := aFogEQLFrom datasources collect: [ :d | d acceptVisitor: self ].
	indexes := [ buffers collect: [ :b | b value all readStream ] ].
	^ (FogEQLResultStream on: buffers)
		index: indexes;
		yourself