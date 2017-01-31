as yet unclassified
extractFromSlot: slot
	| charactersToRead from |
	charactersToRead := (toByte - fromByte) * 2 + 1.
	from := slot size - (fromByte * 2).
	^ slot copyFrom: from - charactersToRead to: from