adding
valuesFor: anInstance
	^ properties collect: [ :p | p name -> (p value: anInstance) ]