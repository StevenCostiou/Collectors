collecting api
collectInstanceVariableNamed: instVarName forObject: anObject
	installer := InstVarCollectInstaller on: self forObject: anObject.
	installer varName: instVarName.
	installer varClass: anObject class.
	"installer install"