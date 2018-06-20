collecting - control
applyTransformationsTo: item from: reifications
	configuration transformations
		do: [ :transformation | 
			item transformations
				at: transformation name
				put: (transformation evaluateWith: reifications) ]