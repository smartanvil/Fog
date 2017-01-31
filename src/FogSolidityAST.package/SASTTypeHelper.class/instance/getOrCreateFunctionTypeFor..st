as yet unclassified
getOrCreateFunctionTypeFor: aFunction
	^ types
		at: aFunction signature
		ifAbsent: [ | type |
			type := SASTFunctionType new
				parameters: aFunction parameters;
				returns: aFunction return;
				yourself.
			self install: type.
			type ]