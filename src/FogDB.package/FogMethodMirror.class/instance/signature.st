accessing
signature
	^ '{1}({2})'
		format:
			{name.
			(',' join: (parameters collect: [ :p | p signatureName ]))}