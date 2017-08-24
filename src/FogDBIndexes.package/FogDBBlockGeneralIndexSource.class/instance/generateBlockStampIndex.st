stamp-indexing
generateBlockStampIndex
	| index |
	index := Array new: blocks size.
	1 to: blocks size do: [ :i | [ self extractBlockStampIndexEntry: i into: index ] schedule ].
	^ index