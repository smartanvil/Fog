encode decode
decodeStream: aContent type: aType
	^ aType unpackStream: aContent using: self hexadecimalPacker