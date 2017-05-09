building methods
compilableClassMethods
	^ {(self compilableMethod: description mirror constructor).
	self compilableVersionMethod.
	self compilableDescriptionNameAccessor}