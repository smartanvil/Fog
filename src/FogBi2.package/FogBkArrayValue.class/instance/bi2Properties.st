as yet unclassified
bi2Properties
	^ value value
		collect: [ :b | 
			FogValue new 
				name: b number;
				value: b;
				yourself ]