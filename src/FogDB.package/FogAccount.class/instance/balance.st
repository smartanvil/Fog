equality
balance
	^ (self connection eth getBalance: self address blockTag: #latest) asBKNumber 