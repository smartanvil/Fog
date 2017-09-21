accessing
at: aBlockIdOrHash
	^ self transform: (self connection findBlockByHash: (aBlockIdOrHash asBKHexa: 64) full: true)