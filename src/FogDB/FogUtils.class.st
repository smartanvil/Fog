"
This is a work-around object. We should implement the eliptic security for http. This object is used for querying some sites data as etherchain. 
"
Class {
	#name : #FogUtils,
	#superclass : #Object,
	#category : 'FogDB-Util'
}

{ #category : #private }
FogUtils >> chopBlanks: aString [
	| rslt |
	aString size = 0
		ifTrue: [ ^ aString ].
	rslt := (String crlf , ' ' includes: aString first)
		ifTrue: [ self chopBlanks: (aString copyFrom: 2 to: aString size) ]
		ifFalse: [ aString ].
	rslt size = 0
		ifTrue: [ ^ rslt ].
	rslt := (String crlf , ' ' includes: rslt last)
		ifTrue: [ self chopBlanks: (rslt copyFrom: 1 to: rslt size - 1) ]
		ifFalse: [ rslt ].
	^ rslt
]

{ #category : #compiling }
FogUtils >> compileSolidity: sourceCodeFile [
	| command return compiled compiledStream binary binaryRuntime abi ast tmp2 |
	tmp2 := '/tmp/out{1}.txt' format: {sourceCodeFile hash asString}.
	command := ' cd {3}; solc --abi --bin --bin-runtime {1} >{2}'
		format:
			{sourceCodeFile fullName.
			tmp2.
			sourceCodeFile asFileReference parent fullName}.
	return := [ :spec | 
	spec
		command: 'bash';
		option: '-c';
		argument: command ] asOSTask future.
	compiled := return synchronizeTimeout: 10 seconds.
	compiled := tmp2 asFileReference readStream upToEnd.
	compiledStream := (((((compiled copyReplaceAll: String lf with: '') copyReplaceAll: 'Binary of the runtime part:' with: '^') copyReplaceAll: 'Binary:' with: '^')
		copyReplaceAll: 'Contract JSON ABI'
		with: '^') copyReplaceAll: ' ' with: '') readStream.
	compiledStream upTo: $^.
	binary := compiledStream upTo: $^.
	binaryRuntime := compiledStream upTo: $^.
	abi := compiledStream upTo: $^.
	tmp2 asFileReference delete.
	command := ' cd {3}; solc --ast-json {1} 1> {2} '
		format:
			{sourceCodeFile fullName.
			tmp2.
			sourceCodeFile asFileReference  parent fullName}.
	return := [ :spec | 
	spec
		command: 'bash';
		option: '-c';
		argument: command ] asOSTask future.
	compiled := return synchronizeTimeout: 30 seconds.
	compiledStream := tmp2 asFileReference readStream.
	compiledStream
		upToAll: '=======';
		upToAll: '======='.
	ast := compiledStream upToAll: '======= SimpleStorage ======='.
	^ {(#binary -> binary).
	(#runtime -> binaryRuntime).
	(#abi -> (NeoJSONReader fromString: abi)).
	(#ast -> (NeoJSONReader fromString: ast))} asDictionary
]

{ #category : #'fetch - contract' }
FogUtils >> decodeHTMLEscapeCharacters: aString [
	"Decode common HTML escaped expression in the form of &xyz; to the actual character "

	| decoding |
	decoding := aString copyWithRegex: '&(gt|#62);' matchesReplacedWith: '>'.
	decoding := decoding copyWithRegex: '&(lt|#60);' matchesReplacedWith: '<'.
	decoding := decoding copyWithRegex: '&(amp|#38);' matchesReplacedWith: '&'.
	decoding := decoding copyWithRegex: '&(quot|#34);' matchesReplacedWith: '"'.
	decoding := decoding copyWithRegex: '&#39;' matchesReplacedWith: ''''.
	^ decoding
]

{ #category : #'fetch - contract' }
FogUtils >> fetchEtherscanContractFrom: address [
	"Encapsulating the proccess to fetch a contract source from an etherscan website"

	| pagestr tagstr tagindex closedtagindex contract |
	"Fetch the webpage content as string"
	pagestr := (ZnEasy get: (self formatEtherscanContractAddress: address)) entity contents.

	"Find the start and end index of the contract code"
	tagstr := ''.
	tagindex := pagestr findString: '^'.
	tagindex = 0
		ifTrue:
			[ tagstr := '<pre class="js-sourcecopyarea" id="editor" style="height: 330px; max-height: 450px; margin-top: 5px;">'.
			tagindex := pagestr findString: tagstr ].
	tagindex = 0
		ifTrue:
			[ tagstr := '<pre class=''js-sourcecopyarea'' id=''editor'' style=''height: 330px; max-height: 450px; margin-top: 5px;''>'.
			tagindex := pagestr findString: tagstr ].
	tagindex = 0
		ifTrue: [ ^ '' ].
	closedtagindex := pagestr findString: '</pre><br>' startingAt: tagindex.

	"Extract the contract code from the page content"
	contract := pagestr copyFrom: tagindex + tagstr size to: closedtagindex - 1.
	(contract indexOf: $^) ~= 0
		ifTrue: [ contract := contract copyFrom: (contract indexOf: $^) to: contract size ].
	^ self decodeHTMLEscapeCharacters: contract
]

{ #category : #formatting }
FogUtils >> formatEtherscanContractAddress: address [
	"Format address to remove #code (the standard in etherscan links)"

	| sharpindex |
	sharpindex := address findString: '#'.
	sharpindex == 0
		ifFalse: [ ^ address copyFrom: 1 to: sharpindex - 1 ]
		ifTrue: [ ^ address ]
]

{ #category : #compiling }
FogUtils >> loadSolcFile: aFileReference [
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
]
