instance creation
fromBinary: aBinary
	| stream result |
	stream := (aBinary copyReplaceAll: '0x' with: '') readStream.
	result := OrderedCollection new.
	[ stream atEnd ] whileFalse: [ result add: ((self instructionFor: (stream next: 2)) loadParametersFrom: stream) ].
	^ self new
		sequence: result;
		yourself