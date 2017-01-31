adding
property: aPropertyName at: anInstance
	^ (properties detect: [ :p | p name = aPropertyName ]) value: anInstance