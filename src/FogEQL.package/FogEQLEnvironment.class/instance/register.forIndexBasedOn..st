initialization
register: indexTag forIndexBasedOn: aClass
	indexTags at: indexTag ifAbsentPut: [ self indexInstanceFor: aClass ]