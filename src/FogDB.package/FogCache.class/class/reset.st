accessing
reset
	| childs |
	childs := current ifNil: [ {} ] ifNotNil: [ current caches ].
	current := nil.
	childs do: [ :c | self current adoptCache: c ]