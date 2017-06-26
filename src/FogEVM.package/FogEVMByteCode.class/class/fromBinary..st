instance creation
fromBinary: anHexaContent
	| stream result |
	stream := (anHexaContent copyReplaceAll: '0x' with: '') readStream.
	result := OrderedCollection new.
	[ stream atEnd ]
		whileFalse: [ | instruction byteLocation |
			byteLocation := stream position / 2.
			instruction := self instructionFor: (stream next: 2).
			instruction loadParametersFrom: stream.
			result
				add:
					(FogEVMMnemonicExecutableMemoryEntry new
						byteNumber: byteLocation;
						instruction: instruction) ].
	^ self new
		content: result;
		yourself