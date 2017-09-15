as yet unclassified
invalidOperation: anOperation over: aLeft with: aRight
	self
		error:
			'The operation ' , anOperation asString , ' does not allows to operate ' , aLeft species asString
				, ' with ' , aRight species asString