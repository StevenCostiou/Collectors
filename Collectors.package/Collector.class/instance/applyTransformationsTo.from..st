collecting - control
applyTransformationsTo: item from: reifications
	configuration transformations isEmpty
		ifFalse: [ | transformation |
			transformation := configuration transformations first.
			item transformations
				at: transformation name
				put: (transformation evaluateWith: reifications) ]