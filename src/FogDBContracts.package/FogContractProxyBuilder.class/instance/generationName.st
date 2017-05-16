building names
generationName
	^ name ifNil: [ name := '' join: (('_' split: description name) collect: [ :d | d capitalized ]) ]