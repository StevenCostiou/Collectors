collect - api
collectTempVarNamed: varName inMethodNamed: methodName inClass: aClass
	| collector |
	collector := self new collectTemporaryObjectNamed: varName in: methodName from: aClass.
	self registry add: collector.
	^ collector