accessing
reset
	| childs |
	childs := current caches.
	current := nil.
	childs do: [ :c | self current adoptCache: c ]