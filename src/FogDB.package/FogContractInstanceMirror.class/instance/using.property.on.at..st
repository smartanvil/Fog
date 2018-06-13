adding
using: session property: aPropertyName on: anInstance at: aBlockTagNumberOrHash
	^ (properties detect: [ :p | p name = aPropertyName ]) using: session value: anInstance  at: aBlockTagNumberOrHash