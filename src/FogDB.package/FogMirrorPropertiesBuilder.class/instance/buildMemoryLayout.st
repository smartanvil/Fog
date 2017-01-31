as yet unclassified
buildMemoryLayout
	| layout |
	layout := FogSolidityLayoutMapper new.
	layout map: contractSlots.
	^ layout