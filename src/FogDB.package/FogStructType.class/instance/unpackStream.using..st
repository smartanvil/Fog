as yet unclassified
unpackStream: aReadStream using: aFogPacker
	| content substream |
	content := aReadStream contents.
	substream := (content copyFrom: content size - (self staticSlotSize * 2) to: content size) readStream.
	^ fields collect: [ :f | f name -> (f unpackStream: substream using: aFogPacker) ]