as yet unclassified
name
	| in out |
	in := ',' join: (parameters types collect: #name).
	out := ',' join: (returns types collect: #name).
	^ 'function({1})returns({2})'
		format:
			{in.
			out}