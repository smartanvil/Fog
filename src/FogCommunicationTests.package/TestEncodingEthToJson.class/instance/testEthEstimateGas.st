broken
testEthEstimateGas
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