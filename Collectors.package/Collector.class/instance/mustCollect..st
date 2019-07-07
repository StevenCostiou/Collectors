collecting - control
mustCollect: reifications
	^ configuration conditions isEmpty
		or: [ configuration conditions first evaluateWith: reifications ]