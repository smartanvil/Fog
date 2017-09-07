initialization
studyCase
	^ '
select instance
from instance in blocks
where instance.transactions.size > 3 
and instance.timestamp > ''2016-01-01T10:00:00+02:00'' Date 
and instance.timestamp < ''2016-03-01T21:53:02+02:00'' Date
limit 10
'