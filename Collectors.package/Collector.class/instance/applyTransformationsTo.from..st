collecting - control
applyTransformationsTo: item from: reifications
	item
		transformations: (configuration transformations collect: [ :transformation | transformation evaluateWith: reifications ])