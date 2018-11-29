"
Testing of the ETH api object 
"
Class {
	#name : #TestEncodingEthToJson,
	#superclass : #FogTestCase,
	#instVars : [
		'eth'
	],
	#category : #FogCommTests
}

{ #category : #running }
TestEncodingEthToJson >> setUp [
	super setUp.
	eth := FogEthereumAPI new
]

{ #category : #tests }
TestEncodingEthToJson >> testEthAccounts [
	self assertEntityFromMessage: eth messageAccounts equalsToJson: '{"jsonrpc":"2.0","method":"eth_accounts","params":[],"id":1}'

]

{ #category : #tests }
TestEncodingEthToJson >> testEthBlockFilter [
	self assertEntityFromMessage: eth messageNewBlockFilter equalsToJson: '{"jsonrpc":"2.0","method":"eth_newBlockFilter","params":[],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthBlockNumber [
	self assertEntityFromMessage: eth messageBlockNumber equalsToJson: '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}'

]

{ #category : #broken }
TestEncodingEthToJson >> testEthCall [
	"	Object - The transaction call object
from: DATA, 20 Bytes - (optional) The address the transaction is sent from.
to: DATA, 20 Bytes - The address the transaction is directed to.
gas: QUANTITY - (optional) Integer of the gas provided for the transaction execution. eth_call consumes zero gas, but this parameter may be needed by some executions.
gasPrice: QUANTITY - (optional) Integer of the gasPrice used for each paid gas
value: QUANTITY - (optional) Integer of the value send with this transaction
data: DATA - (optional) Hash of the method signature and encoded parameters. For details see Ethereum Contract ABI "

	| callDefinition |
	callDefinition := FogCallDefinition new
		from: '0xb60e8dd61c5d32be8058bb8eb970870f07233155';
		to: '0xd46e8dd67c5d32be8058bb8eb970870f07244567';
		gas: 30400 priced: 10000000000000;
		value: 2441406250;
		data: '0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675';
		yourself.
	self
		assertEntityFromMessage: (eth messageCall: callDefinition)
		equalsToJson:
			'{"jsonrpc":"2.0","method":"eth_call","params": [{ 
				"from": "0xb60e8dd61c5d32be8058bb8eb970870f07233155", "to": "0xd46e8dd67c5d32be8058bb8eb970870f07244567",  
				"gas": "0x76c0",  "gasPrice": "0x9184e72a000","value": "0x9184e72a","nounce":"0x0",
			   "data": "0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675"}] ,"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthCoinBase [
	self assertEntityFromMessage: eth messageCoinBase equalsToJson: '{"jsonrpc":"2.0","method":"eth_coinbase","params":[],"id":1}'

]

{ #category : #tests }
TestEncodingEthToJson >> testEthCompileLLL [
	self
		assertEntityFromMessage: (eth messageCompileLLL: '(returnlll (suicide (caller)))')
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_compileLLL","params":["(returnlll (suicide (caller)))"],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthCompileSerpent [
	self
		assertEntityFromMessage: (eth messageCompileSerpent: '/* serpent */ ')
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_compileSerpent","params":["/* serpent */ "],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthCompileSolidity [
	self
		assertEntityFromMessage: (eth messageCompileSolidity: 'contract test { function multiply(uint a) returns(uint d) {   return a * 7;   } }')
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_compileSolidity","params":["contract test { function multiply(uint a) returns(uint d) {   return a * 7;   } }"],"id":1}'
]

{ #category : #broken }
TestEncodingEthToJson >> testEthEstimateGas [
	"	Object - The transaction call object
from: DATA, 20 Bytes - (optional) The address the transaction is sent from.
to: DATA, 20 Bytes - The address the transaction is directed to.
gas: QUANTITY - (optional) Integer of the gas provided for the transaction execution. eth_call consumes zero gas, but this parameter may be needed by some executions.
gasPrice: QUANTITY - (optional) Integer of the gasPrice used for each paid gas
value: QUANTITY - (optional) Integer of the value send with this transaction
data: DATA - (optional) Hash of the method signature and encoded parameters. For details see Ethereum Contract ABI "

	| callDefinition |
	callDefinition := FogCallDefinition new
		from: '0xb60e8dd61c5d32be8058bb8eb970870f07233155';
		to: '0xd46e8dd67c5d32be8058bb8eb970870f07244567';
		gas: 30400 priced: 10000000000000;
		value: 2441406250;
		data: '0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675';
		yourself.
	self
		assertEntityFromMessage: (eth messageEstimateGas: callDefinition)
		equalsToJson:
			'{"jsonrpc":"2.0","method":"eth_estimateGas","params": [{ 
				"from": "0xb60e8dd61c5d32be8058bb8eb970870f07233155", "to": "0xd46e8dd67c5d32be8058bb8eb970870f07244567",  
				"gas": "0x76c0",  "gasPrice": "0x9184e72a000","value": "0x9184e72a", "nounce":"0x0",
			   "data": "0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675"}] ,"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGasPrice [
	self assertEntityFromMessage: eth messageGasPrice equalsToJson: '{"jsonrpc":"2.0","method":"eth_gasPrice","params":[],"id":1}'

]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetBalanceBlockNumber [
	self
		assertEntityFromMessage: (eth messageGetBalance: '0x407d73d8a49eeb85d32cf465507dd71d507100c1' blockNumber: 1)
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getBalance","params":["0x407d73d8a49eeb85d32cf465507dd71d507100c1", "0x1"],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetBalanceTag [
	self
		assertEntityFromMessage: (eth messageGetBalance: '0x407d73d8a49eeb85d32cf465507dd71d507100c1' blockTag: 'latest')
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getBalance","params":["0x407d73d8a49eeb85d32cf465507dd71d507100c1", "latest"],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetBlockByHash [
	self
		assertEntityFromMessage: (eth messageGetBlockByHash: '0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331' full: true)
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getBlockByHash","params":["0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331", true],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetBlockByNumber [
	self
		assertEntityFromMessage: (eth messageGetBlockByNumber: 436 full: true)
		equalsToJson:'{"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["0x1b4", true],"id":1}'

]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetBlockByTag [
	self
		assertEntityFromMessage: (eth messageGetBlockByTag: 'latest' full: true)
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["latest", true],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetBlockTransactionCountByHash [
	self
		assertEntityFromMessage: (eth messageGetBlockTransactionCountByHash: '0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238')
		equalsToJson:
			'{"jsonrpc":"2.0","method":"eth_getBlockTransactionCountByHash","params":["0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238"],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetBlockTransactionCountByNumber [
	self
		assertEntityFromMessage: (eth messageGetBlockTransactionCountByNumber: 232)
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getBlockTransactionCountByNumber","params":["0xe8"],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetCode [
	self
		assertEntityFromMessage: (eth messageGetCode: '0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b' blockNumber: 2)
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getCode","params":["0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b", "0x2"],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetCodeTag [
	self
		assertEntityFromMessage: (eth messageGetCode: '0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b' blockTag: 'latest')
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getCode","params":["0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b", "latest"],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetCompilers [
	self assertEntityFromMessage: eth messageGetCompilers equalsToJson: '{"jsonrpc":"2.0","method":"eth_getCompilers","params":[],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetFilterChanges [
	self
		assertEntityFromMessage: (eth messageGetFilterChanges: 11)
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getFilterChanges","params":[ "0xb"],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetFilterLogs [
	self
		assertEntityFromMessage: (eth messageGetFilterLogs: 11)
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getFilterLogs","params":[ "0xb"],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetLogs [
	| filterDefinition |
	filterDefinition := FogFilterDefinition new
		topics: (FogFilterTopic subject: '0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b');
		yourself.
	self
		assertEntityFromMessage: (eth messageGetLogs: filterDefinition)
		equalsToJson:
			'{"jsonrpc":"2.0","method":"eth_getLogs","params":[ { "topics": ["0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b"]}],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetStorageAtBlockNumber [
	self
		assertEntityFromMessage: (eth messageGetStorageAt: '0x295a70b2de5e3953354a6a8344e616ed314d7251' upTo: 0 blockNumber: 1)
		equalsToJson: '{"jsonrpc":"2.0", "method": "eth_getStorageAt", "params": ["0x295a70b2de5e3953354a6a8344e616ed314d7251", "0x0", "0x1"], "id": 1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetStorageAtBlockTag [
	self
		assertEntityFromMessage: (eth messageGetStorageAt: '0x295a70b2de5e3953354a6a8344e616ed314d7251' upTo: 0 blockTag: 'earliest')
		equalsToJson: '{"jsonrpc":"2.0", "method": "eth_getStorageAt", "params": ["0x295a70b2de5e3953354a6a8344e616ed314d7251", "0x0", "earliest"], "id": 1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetTransactionByBlockHashAndIndex [
	self
		assertEntityFromMessage: (eth messageGetTransactionByBlockHash: '0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331' andIndex: 0)
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getTransactionByBlockHashAndIndex","params":["0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331","0x0"],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetTransactionByBlockNumberAndIndex [
	self assertEntityFromMessage: (eth messageGetTransactionByBlockNumber: 668 andIndex: 0) equalsToJson: '{"jsonrpc":"2.0","method":"eth_getTransactionByBlockNumberAndIndex","params":["0x29c","0x0"],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetTransactionByBlockTagAndIndex [
	self assertEntityFromMessage: (eth messageGetTransactionByBlockTag: 'latest' andIndex: 0) equalsToJson: '{"jsonrpc":"2.0","method":"eth_getTransactionByBlockNumberAndIndex","params":["latest","0x0"],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetTransactionByHash [
	self
		assertEntityFromMessage: (eth messageGetTransactionByHash: '0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238')
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getTransactionByHash","params":["0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238"],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetTransactionCountBlockNumber [
	self
		assertEntityFromMessage: (eth messageGetTransactionCount: '0x407d73d8a49eeb85d32cf465507dd71d507100c1' blockNumber: 1)
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getTransactionCount","params":["0x407d73d8a49eeb85d32cf465507dd71d507100c1","0x1"],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetTransactionCountBlockTag [
	self
		assertEntityFromMessage: (eth messageGetTransactionCount: '0x407d73d8a49eeb85d32cf465507dd71d507100c1' blockTag: 'latest')
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getTransactionCount","params":["0x407d73d8a49eeb85d32cf465507dd71d507100c1","latest"],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetTransactionReceipt [
	self
		assertEntityFromMessage: (eth messageGetTransactionReceipt: '0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238')
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getTransactionReceipt","params":["0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238"],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetUncleByBlockHashAndIndex [
	self
		assertEntityFromMessage: (eth messageGetUncleByBlockHash: '0xc6ef2fc5426d6ad6fd9e2a26abeab0aa2411b7ab17f30a99d3cb96aed1d1055b' andIndex: 0)
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_getUncleByBlockHashAndIndex","params":["0xc6ef2fc5426d6ad6fd9e2a26abeab0aa2411b7ab17f30a99d3cb96aed1d1055b", "0x0"],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetUncleByBlockNumberAndIndex [
	self assertEntityFromMessage: (eth messageGetUncleByBlockNumber: 668 andIndex: 0) equalsToJson: '{"jsonrpc":"2.0","method":"eth_getUncleByBlockNumberAndIndex","params":["0x29c", "0x0"],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetUncleByBlockTagAndIndex [
	self assertEntityFromMessage: (eth messageGetUncleByBlockTag: 'latest' andIndex: 0) equalsToJson: '{"jsonrpc":"2.0","method":"eth_getUncleByBlockNumberAndIndex","params":["latest", "0x0"],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetUncleCountByBlockHash [
	self
		assertEntityFromMessage: (eth messageGetUncleCountByBlockHash: '0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238')
		equalsToJson:
			'{"jsonrpc":"2.0","method":"eth_getUncleCountByBlockHash","params":["0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238"],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthGetWork [
	self assertEntityFromMessage: eth messageGetWork equalsToJson: '{"jsonrpc":"2.0","method":"eth_getWork","params":[],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthHashrate [
	self assertEntityFromMessage: eth messageHashrate equalsToJson: '{"jsonrpc":"2.0","method":"eth_hashrate","params":[],"id":1}'

]

{ #category : #tests }
TestEncodingEthToJson >> testEthMining [
	self
		assertEntityFromMessage: eth messageMining
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_mining","params":[],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthNewFilter [
	| filterDefinition |
	filterDefinition := FogFilterDefinition new
		from: 1;
		to: 2;
		address: '0x8888f1f195afa192cfee860698584c030f4c9db1';
		topics:
			(((FogFilterTopic subject: '0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b') and: FogFilterTopic any)
				and:
					(FogFilterTopic
						subject: '0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b'
						or: '0x000000000000000000000000aff3454fce5edbc8cca8697c15331677e6ebccc')).
	self
		assertEntityFromMessage: (eth messageNewFilter: filterDefinition)
		equalsToJson:
			'{"jsonrpc":"2.0","method":"eth_newFilter","params":[{ "fromBlock": "0x1", "toBlock": "0x2", "address": "0x8888f1f195afa192cfee860698584c030f4c9db1", "topics": ["0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b", null, ["0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b", "0x000000000000000000000000aff3454fce5edbc8cca8697c15331677e6ebccc"]]}],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthNewPendingTransactionFilter [
	self
		assertEntityFromMessage: eth messageNewPendingTransactionFilter
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_newPendingTransactionFilter","params":[],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthProtocolVersion [
	self assertEntityFromMessage: eth messageProtocolVersion equalsToJson: '{"jsonrpc":"2.0","method":"eth_protocolVersion","params":[],"id":1}'
]

{ #category : #broken }
TestEncodingEthToJson >> testEthSendRawTransaction [
	"	Object - The transaction call object
from: DATA, 20 Bytes - (optional) The address the transaction is sent from.
to: DATA, 20 Bytes - The address the transaction is directed to.
gas: QUANTITY - (optional) Integer of the gas provided for the transaction execution. eth_call consumes zero gas, but this parameter may be needed by some executions.
gasPrice: QUANTITY - (optional) Integer of the gasPrice used for each paid gas
value: QUANTITY - (optional) Integer of the value send with this transaction
data: DATA - (optional) Hash of the method signature and encoded parameters. For details see Ethereum Contract ABI "

	self
		assertEntityFromMessage: (eth messageSendRawTransaction: '0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675')
		equalsToJson:
			'{"jsonrpc":"2.0","method":"eth_sendRawTransaction","params": ["0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675"] ,"id":1}'
]

{ #category : #broken }
TestEncodingEthToJson >> testEthSendTransaction [
	"	Object - The transaction call object
from: DATA, 20 Bytes - (optional) The address the transaction is sent from.
to: DATA, 20 Bytes - The address the transaction is directed to.
gas: QUANTITY - (optional) Integer of the gas provided for the transaction execution. eth_call consumes zero gas, but this parameter may be needed by some executions.
gasPrice: QUANTITY - (optional) Integer of the gasPrice used for each paid gas
value: QUANTITY - (optional) Integer of the value send with this transaction
data: DATA - (optional) Hash of the method signature and encoded parameters. For details see Ethereum Contract ABI "

	| callDefinition |
	callDefinition := FogCallDefinition new
		from: '0xb60e8dd61c5d32be8058bb8eb970870f07233155';
		to: '0xd46e8dd67c5d32be8058bb8eb970870f07244567';
		gas: 30400 priced: 10000000000000;
		value: 2441406250;
		data: '0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675';
		yourself.
	self
		assertEntityFromMessage: (eth messageSendTransaction: callDefinition)
		equalsToJson:
			'{"jsonrpc":"2.0","method":"eth_sendTransaction","params": [{ 
				"from": "0xb60e8dd61c5d32be8058bb8eb970870f07233155", "to": "0xd46e8dd67c5d32be8058bb8eb970870f07244567",  
				"gas": "0x76c0",  "gasPrice": "0x9184e72a000","value": "0x9184e72a","nounce":"0x0", 
			   "data": "0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675"}] ,"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthSign [
	self
		assertEntityFromMessage:
			(eth
				messageSignWith: '0x8a3106a3e50576d4b6794a0e74d3bb5f8c9acaab'
				sha3Data: '0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470')
		equalsToJson:
			'{"jsonrpc":"2.0","method":"eth_sign","params":["0x8a3106a3e50576d4b6794a0e74d3bb5f8c9acaab", "0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470"],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthSubmitHashRate [
	self
		assertEntityFromMessage:
			(eth
				messageSubmitHashrate: '0x0000000000000000000000000000000000000000000000000000000000500000'
				clientId: '0x59daa26581d0acd1fce254fb7e85952f4c09d0915afd33d3886cd914bc7d283c')
		equalsToJson:
			'{"jsonrpc":"2.0","method":"eth_submitHashrate","params":[  "0x0000000000000000000000000000000000000000000000000000000000500000",
  "0x59daa26581d0acd1fce254fb7e85952f4c09d0915afd33d3886cd914bc7d283c"],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthSubmitWork [
	self
		assertEntityFromMessage:
			(eth
				messageSubmitWork: '0x0000000000000001'
				header: '0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef'
				digest: '0xD1FE5700000000000000000000000000D1FE5700000000000000000000000000')
		equalsToJson:
			'{"jsonrpc":"2.0","method":"eth_submitWork","params":[ "0x0000000000000001",
  "0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef",
  "0xD1FE5700000000000000000000000000D1FE5700000000000000000000000000"],"id":1}'
]

{ #category : #tests }
TestEncodingEthToJson >> testEthSyncing [
	self assertEntityFromMessage: eth messageSyncing equalsToJson: '{"jsonrpc":"2.0","method":"eth_syncing","params":[],"id":1}'

]

{ #category : #tests }
TestEncodingEthToJson >> testEthUninstallFilter [
	self
		assertEntityFromMessage: (eth messageUninstallFilterID: 11)
		equalsToJson: '{"jsonrpc":"2.0","method":"eth_uninstallFilter","params":[ "0xb"],"id":1}'
]
