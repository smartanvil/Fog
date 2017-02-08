accessing
name
	^ '{1}({2}) returns{3}'
		format:
			{name.
			(',' join: (parameters collect: [ :p | p name ])).
			'Contract'}