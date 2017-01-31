required
showableProperties
	^ mirror properties
		collect: [ :property | 
			FogValue new
				name: property name;
				value: (property value: instance) ]