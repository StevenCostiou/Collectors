collecting - control
beForObject: anObject
	installer uninstall.
	installer weakObject: anObject.
	installer forObject.
	installer initializeLink.
	installer install