accessing
at: aBlockIdOrHash
	^ self transform: (self connection findBlockByHash: aBlockIdOrHash asBKHexa full: true)