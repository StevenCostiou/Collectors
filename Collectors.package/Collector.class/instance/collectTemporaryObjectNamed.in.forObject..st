collecting api
collectTemporaryObjectNamed: aVarName in: aMethodName forObject: anObject
	installer := TempVarCollectInstaller on: self forObject: anObject.
	installer varName: aVarName.
	installer varClass: anObject class.
	installer methodName: aMethodName.
	installer install