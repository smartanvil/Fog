required
showableProperties
	^ mirror instanceMirror properties
		collect: [ :property | 
			FogValue new
				name: property name;
				value: (property value: instance) ]