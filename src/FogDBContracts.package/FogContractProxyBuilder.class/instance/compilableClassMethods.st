building methods
compilableClassMethods
	^ {(self compilableClassMethod: description mirror constructor).
	self compilableVersionMethod.
	self compilableDescriptionNameAccessor}