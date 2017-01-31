as yet unclassified
relatedStorages
	^ relatedStorage := (self transactions
		inject: Set new
		into: [ :ac :t | 
			ac
				add: t from;
				add: t to;
				yourself ])
		collect: [ :a | self connection eth getStorageAt: a upTo: 0 blockNumber: self number ]