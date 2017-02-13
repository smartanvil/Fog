as yet unclassified
bi2Properties
	^ value value
		collect: [ :b | 
			FogValue
				name: b number;
				value: b;
				yourself ]