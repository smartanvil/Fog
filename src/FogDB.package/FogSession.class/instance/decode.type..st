encode decode
decode: aContent type: aType
	^ aType unpack: aContent using: self hexadecimalPacker