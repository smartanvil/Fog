accessing
mirror
	| builder |
	mirror := FogContractMirror new.
	ast
		ifNotNil: [ builder := FogMirrorPropertiesBuilder new.
			self ast accept: builder.
			builder buildInto: mirror.
			self mapper map: mirror.
			builder := FogMirrorMethodsBuilder new.
			builder process: abi with: ast types.
			builder buildInto: mirror ].
	^ mirror