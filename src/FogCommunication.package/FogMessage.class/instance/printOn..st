as yet unclassified
printOn: aStream
	^('RPC message:{1} parameters:{2}'
		format:
			{method.
			parameters asString}) printOn: aStream