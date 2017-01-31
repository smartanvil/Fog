as yet unclassified
unpack: aSetOfStrings using: anETHPacker
	^ (aSetOfStrings
		with: fields
		collect: [ :content :field | field name -> (field type unpack: content using: anETHPacker) ])
		asDictionary