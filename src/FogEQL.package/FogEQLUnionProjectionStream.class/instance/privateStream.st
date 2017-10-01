accessing
privateStream
	^ privateStream
		ifNil: [ privateStream := (firstCollection reset upToEnd union: secondCollection reset upToEnd)
				readStream ]