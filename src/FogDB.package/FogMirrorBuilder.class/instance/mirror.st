accessing
mirror
	| builder mirror |
	mirror := FogContractMirror new.
	ast
		ifNotNil: [ builder := self propertiesBuilder.
			ast acceptVisitor: builder.
			builder buildInto: mirror.
			self memoryMapper map: mirror instanceMirror ].
	^ mirror