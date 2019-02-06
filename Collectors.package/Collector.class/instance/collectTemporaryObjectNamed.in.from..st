collecting api
collectTemporaryObjectNamed: aVarName in: aMethodName from: aClass
	installer := TempVarCollectInstaller on: self.
	installer varName: aVarName.
	installer varClass: aClass.
	installer methodName: aMethodName.
	"installer install"