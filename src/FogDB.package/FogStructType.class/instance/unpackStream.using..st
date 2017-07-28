as yet unclassified
unpackStream: aReadStream using: aFogPacker
	| content substream |
	content := aReadStream contents.
	substream := (content
		copyFrom: content size - (self staticSlotSize * 2 - 1)
		to: content size) readStream.
	^ (fields reverse
		collect: [ :f | f name -> (f unpackStream: substream using: aFogPacker) ]) asDictionary