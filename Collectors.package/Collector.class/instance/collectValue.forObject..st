collecting api
collectValue: node forObject: anObject
	installer := ValueCollectInstaller on: self forObject: anObject.
	installer node: node.
	"installer install"