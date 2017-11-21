fetch - contract
fetchEtherscanContractFrom: address
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