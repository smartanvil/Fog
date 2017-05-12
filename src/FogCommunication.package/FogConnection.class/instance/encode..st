converting
encode: aETHMessage
	^ NeoJSONWriter toString: (self transferEntityFromMessage: aETHMessage)