collecting api
collectReceiver: node forObject: anObject
	installer := ReceiverCollectInstaller on: self forObject: anObject.
	installer node: node.
	"installer install"