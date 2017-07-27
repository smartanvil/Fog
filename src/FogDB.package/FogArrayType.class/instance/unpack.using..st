as yet unclassified
unpack: anArray using: aFogPacker
	^ anArray collect: [ :chunk | inner unpackStream: chunk readStream using: aFogPacker ]