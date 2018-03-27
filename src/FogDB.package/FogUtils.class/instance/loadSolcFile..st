compiling
loadSolcFile: aFileReference
	| dic compiled infoFor |
	dic := Dictionary new.
	compiled := aFileReference readStream.
	compiled upToAll: '======='.
	[ compiled atEnd ]
		whileFalse: [ | binary runtime abi |
			compiled upToAll: ':'.
			infoFor := (compiled upToAll: '=======') copyReplaceAll: ' ' with: ''.
			dic at: infoFor put: Dictionary new.
			compiled upToAll: 'Binary:'.
			binary := self chopBlanks: (compiled upToAll: 'Binary of the runtime part:').
			runtime := self chopBlanks: (compiled upToAll: 'Contract JSON ABI').
			abi := self chopBlanks: (compiled upToAll: '=======').
			(dic at: infoFor) at: #binary put: binary.
			(dic at: infoFor) at: #runtime put: runtime.
			(dic at: infoFor) at: #abi put: abi ].
	^ dic