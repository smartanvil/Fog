enumerating
do: aBlockClosure
	1 to: self size by: step do: [ :i | aBlockClosure value: (self at: i) ]