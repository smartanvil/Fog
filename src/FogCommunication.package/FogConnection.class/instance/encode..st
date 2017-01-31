as yet unclassified
encode: aETHMessage
	^ NeoJSONWriter toString: (self transferEntityFromMessage: aETHMessage)