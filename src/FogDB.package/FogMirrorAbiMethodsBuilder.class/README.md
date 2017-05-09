This is a method mirror builder. It works with the ABI format related to a contract. 
It does not analyses the AST, because this one is not always available.

"		builder := self methodsBuilders.
			builder process: abi with: ast types.
			builder buildInto: mirror" 