as yet unclassified
bi2Properties
	^ value value
		collect: [ :b | 
			FogValue new
				name: 'Tx- ' , b transactionIndex asString;
				value: b;
				yourself ]