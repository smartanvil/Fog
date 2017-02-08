tests
testGetExample
	| ex1 ex2 ex3 |
	self halt. 
	ex1 := (mirror method: #getExample) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
	ex2 := (mirror method: #getExample2) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
	ex3 := (mirror method: #getExample3) applyOn: contract valueWithArguments: {} sender: self ownerAccount.
	self halt