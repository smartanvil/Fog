accessing
indexEntryTagOn: aBuffer
	^ '{1}.{2}'
		format:
			{aBuffer bufferName.
			('.' join: (accesses collect: #string))}