collect - api
collectInstVarNamed: varName inClass: aClass
	|collector|
	collector := self new collectInstanceVariableNamed: varName fromClass: aClass.
	self registry add: collector.
	^collector