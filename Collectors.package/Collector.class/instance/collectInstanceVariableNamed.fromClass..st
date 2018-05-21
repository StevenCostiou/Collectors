collecting api
collectInstanceVariableNamed: instVarName fromClass: aClass
	installer := InstVarCollectInstaller on: self.
	installer varName: instVarName.
	installer varClass: aClass.
	installer install