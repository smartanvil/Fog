accessing
name
	^ '{1}({2}) returns ({3})'
		format:
			{name.
			(',' join: (parameters types collect: [ :p | p name])).
			return name}